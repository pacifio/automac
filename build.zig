const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});

    const mod = b.addModule("automac", .{
        .root_source_file = b.path("src/root.zig"),

        .target = target,
    });

    mod.linkFramework("CoreGraphics", .{});
    mod.linkFramework("CoreFoundation", .{});

    const mod_tests = b.addTest(.{
        .root_module = mod,
    });

    const run_mod_tests = b.addRunArtifact(mod_tests);

    const test_step = b.step("test", "Run tests");
    test_step.dependOn(&run_mod_tests.step);
}
