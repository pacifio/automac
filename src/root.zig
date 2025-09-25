const std = @import("std");
const c = @cImport({
    @cInclude("CoreGraphics/CoreGraphics.h");
    @cInclude("CoreFoundation/CoreFoundation.h");
});

pub const MouseButtonLeft = c.kCGMouseButtonLeft;
pub const MouseButtonRight = c.kCGMouseButtonLeft;
pub const MouseButtonMiddle = c.kCGMouseButtonCenter;

pub const MousePosition = struct {
    x: i32,
    y: i32,
};

pub fn getMouse() MousePosition {
    const point = c.CGEventGetLocation(c.CGEventCreate(null));
    return MousePosition{
        .x = @intFromFloat(point.x),
        .y = @intFromFloat(point.y),
    };
}

pub fn moveMouse(x: f64, y: f64) void {
    const event = c.CGEventCreateMouseEvent(
        null,
        c.kCGEventMouseMoved,
        c.CGPointMake(x, y),
        c.kCGMouseButtonLeft,
    );

    if (event) |e| {
        c.CGEventPost(c.kCGHIDEventTap, e);
        c.CFRelease(e);
    }
}

pub fn moveMouseToPosition(pos: MousePosition) void {
    moveMouse(@floatFromInt(pos.x), @floatFromInt(pos.y));
}

fn clickInternal(x: i32, y: i32, button: c.CGMouseButton, down_event: c.CGEventType, up_event: c.CGEventType) void {
    const point = c.CGPointMake(@floatFromInt(x), @floatFromInt(y));
    const down = c.CGEventCreateMouseEvent(
        null,
        down_event,
        point,
        button,
    );

    if (down) |e| {
        c.CGEventPost(c.kCGHIDEventTap, e);
        c.CFRelease(e);
    }

    std.Thread.sleep(10000000); // 10ms

    const up = c.CGEventCreateMouseEvent(null, up_event, point, button);
    if (up) |valid_up| {
        c.CGEventPost(c.kCGHIDEventTap, valid_up);
        c.CFRelease(valid_up);
    }
}

pub fn click(x: i32, y: i32) void {
    clickInternal(x, y, MouseButtonLeft, c.kCGEventLeftMouseDown, c.kCGEventLeftMouseUp);
}

pub fn leftClick(x: i32, y: i32) void {
    clickInternal(x, y, MouseButtonLeft, c.kCGEventLeftMouseDown, c.kCGEventLeftMouseUp);
}

pub fn rightClick(x: i32, y: i32) void {
    clickInternal(x, y, MouseButtonRight, c.kCGEventRightMouseDown, c.kCGEventRightMouseUp);
}

pub fn middleClick(x: i32, y: i32) void {
    clickInternal(x, y, MouseButtonMiddle, c.kCGEventRightMouseDown, c.kCGEventRightMouseUp);
}

pub fn doubleClick(x: i32, y: i32) void {
    leftClick(x, y);
    leftClick(x, y);
}

pub fn drag(
    starting: MousePosition,
    ending: MousePosition,
    duration: u64,
    mouseButton: ?c.CGMouseButton,
) void {
    const activeMouseButton = mouseButton orelse MouseButtonMiddle;

    const start_point = c.CGPointMake(@floatFromInt(starting.x), @floatFromInt(starting.y));
    const end_point = c.CGPointMake(@floatFromInt(ending.x), @floatFromInt(ending.y));
    moveMouse(@floatFromInt(starting.x), @floatFromInt(starting.y));
    std.Thread.sleep(10000000); // 10ms

    const down = c.CGEventCreateMouseEvent(
        null,
        c.kCGEventLeftMouseDown,
        start_point,
        activeMouseButton,
    );
    if (down) |valid_down| {
        c.CGEventPost(c.kCGHIDEventTap, valid_down);
        c.CFRelease(valid_down);
    }

    const steps: i32 = @intCast(@min(duration / 16, 100));
    const delay = (duration * 1000000) / @as(u64, @intCast(steps));

    var i: i32 = 1;
    while (i <= steps) : (i += 1) {
        const progress: f64 = @as(f64, @floatFromInt(i)) / @as(f64, @floatFromInt(steps));
        const current_x = @as(f64, @floatFromInt(starting.x)) + progress * @as(f64, @floatFromInt(ending.x - starting.x));
        const current_y = @as(f64, @floatFromInt(starting.y)) + progress * @as(f64, @floatFromInt(ending.y - starting.y));

        const drag_event = c.CGEventCreateMouseEvent(
            null,
            c.kCGEventLeftMouseDragged,
            c.CGPointMake(current_x, current_y),
            activeMouseButton,
        );

        if (drag_event) |valid_drag| {
            c.CGEventPost(c.kCGHIDEventTap, valid_drag);
            c.CFRelease(valid_drag);
        }

        std.Thread.sleep(delay);
    }

    const up = c.CGEventCreateMouseEvent(
        null,
        c.kCGEventLeftMouseUp,
        end_point,
        activeMouseButton,
    );
    if (up) |valid_up| {
        c.CGEventPost(c.kCGHIDEventTap, valid_up);
        c.CFRelease(valid_up);
    }
}
