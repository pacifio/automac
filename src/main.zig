const std = @import("std");
const automac = @import("automac");

pub fn main() !void {
    std.debug.print("mac automation", .{});

    automac.moveMouseToPosition(automac.MousePosition{ .x = 0, .y = 0 });
}
