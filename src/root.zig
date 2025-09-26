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

pub const DisplySize = struct {
    width: i32,
    height: i32,
};

pub const KeyStroke = enum {
    // Special characters
    tab,
    newline,
    carriage_return,
    space,
    exclamation,
    double_quote,
    hash,
    dollar,
    percent,
    ampersand,
    single_quote,
    open_paren,
    close_paren,
    asterisk,
    plus,
    comma,
    minus,
    dot,
    slash,
    num0,
    num1,
    num2,
    num3,
    num4,
    num5,
    num6,
    num7,
    num8,
    num9,
    colon,
    semicolon,
    less_than,
    equals,
    greater_than,
    question,
    at,
    open_bracket,
    backslash,
    close_bracket,
    caret,
    underscore,
    backtick,

    // Letters
    a,
    b,
    c,
    d,
    e,
    f,
    g,
    h,
    i,
    j,
    k,
    l,
    m,
    n,
    o,
    p,
    q,
    r,
    s,
    t,
    u,
    v,
    w,
    x,
    y,
    z,

    // More symbols
    open_brace,
    pipe,
    close_brace,
    tilde,

    // Named keys
    accept,
    add,
    alt,
    altleft,
    altright,
    apps,
    backspace,
    browserback,
    browserfavorites,
    browserforward,
    browserhome,
    browserrefresh,
    browsersearch,
    browserstop,
    capslock,
    clear,
    convert,
    ctrl,
    ctrlleft,
    ctrlright,
    decimal,
    del,
    delete,
    divide,
    down,
    end,
    enter,
    esc,
    escape,
    execute,
    f1,
    f2,
    f3,
    f4,
    f5,
    f6,
    f7,
    f8,
    f9,
    f10,
    f11,
    f12,
    f13,
    f14,
    f15,
    f16,
    f17,
    f18,
    f19,
    f20,
    f21,
    f22,
    f23,
    f24,
    final,
    fn_key,
    hanguel,
    hangul,
    hanja,
    help,
    home,
    insert,
    junja,
    kana,
    kanji,
    launchapp1,
    launchapp2,
    launchmail,
    launchmediaselect,
    left,
    modechange,
    multiply,
    nexttrack,
    nonconvert,
    numlock,
    pagedown,
    pageup,
    pause,
    pgdn,
    pgup,
    playpause,
    prevtrack,
    print,
    printscreen,
    prntscrn,
    prtsc,
    prtscr,
    return_key,
    right,
    scrolllock,
    select,
    separator,
    shift,
    shiftleft,
    shiftright,
    sleep,
    space_key,
    stop,
    subtract,
    tab_key,
    up,
    volumedown,
    volumemute,
    volumeup,
    win,
    winleft,
    winright,
    yen,
    command,
    option,
    optionleft,
    optionright,
};

pub fn keystrokeToKeyCode(key: KeyStroke) c.CGKeyCode {
    return switch (key) {
        // Numbers
        .num0 => 29,
        .num1 => 18,
        .num2 => 19,
        .num3 => 20,
        .num4 => 21,
        .num5 => 23,
        .num6 => 22,
        .num7 => 26,
        .num8 => 28,
        .num9 => 25,

        // Letters
        .a => 0,
        .b => 11,
        .c => 8,
        .d => 2,
        .e => 14,
        .f => 3,
        .g => 5,
        .h => 4,
        .i => 34,
        .j => 38,
        .k => 40,
        .l => 37,
        .m => 46,
        .n => 45,
        .o => 31,
        .p => 35,
        .q => 12,
        .r => 15,
        .s => 1,
        .t => 17,
        .u => 32,
        .v => 9,
        .w => 13,
        .x => 7,
        .y => 16,
        .z => 6,

        // Special characters and symbols
        .space, .space_key => 49,
        .tab, .tab_key => 48,
        .newline, .enter, .return_key => 36,
        .carriage_return => 36,
        .backspace => 51,
        .delete, .del => 117,
        .esc, .escape => 53,

        // Punctuation
        .exclamation => 18, // Shift + 1
        .double_quote => 39, // Shift + '
        .hash => 20, // Shift + 3
        .dollar => 21, // Shift + 4
        .percent => 23, // Shift + 5
        .ampersand => 26, // Shift + 7
        .single_quote => 39,
        .open_paren => 25, // Shift + 9
        .close_paren => 29, // Shift + 0
        .asterisk => 28, // Shift + 8
        .plus => 24, // Shift + =
        .comma => 43,
        .minus => 27,
        .dot => 47,
        .slash => 44,
        .colon => 41, // Shift + ;
        .semicolon => 41,
        .less_than => 43, // Shift + ,
        .equals => 24,
        .greater_than => 47, // Shift + .
        .question => 44, // Shift + /
        .at => 19, // Shift + 2
        .open_bracket => 33,
        .backslash => 42,
        .close_bracket => 30,
        .caret => 22, // Shift + 6
        .underscore => 27, // Shift + -
        .backtick => 50,
        .open_brace => 33, // Shift + [
        .pipe => 42, // Shift + \
        .close_brace => 30, // Shift + ]
        .tilde => 50, // Shift + `

        // Function keys
        .f1 => 122,
        .f2 => 120,
        .f3 => 99,
        .f4 => 118,
        .f5 => 96,
        .f6 => 97,
        .f7 => 98,
        .f8 => 100,
        .f9 => 101,
        .f10 => 109,
        .f11 => 103,
        .f12 => 111,
        .f13 => 105,
        .f14 => 107,
        .f15 => 113,
        .f16 => 106,
        .f17 => 64,
        .f18 => 79,
        .f19 => 80,
        .f20 => 90,

        // Arrow keys
        .up => 126,
        .down => 125,
        .left => 123,
        .right => 124,

        // Modifier keys
        .shift, .shiftleft => 56,
        .shiftright => 60,
        .ctrl, .ctrlleft => 59,
        .ctrlright => 62,
        .alt, .altleft, .option, .optionleft => 58,
        .altright, .optionright => 61,
        .command => 55,
        .win, .winleft => 55,
        .winright => 54,

        // Extras
        .home => 115,
        .end => 119,
        .pageup, .pgup => 116,
        .pagedown, .pgdn => 121,
        .insert => 114,
        .capslock => 57,
        .numlock => 71,
        .scrolllock => 107,

        else => 0,
    };
}

pub fn charToKeystroke(char: u8) ?KeyStroke {
    return switch (char) {
        'a'...'z' => @enumFromInt(@intFromEnum(KeyStroke.a) + (char - 'a')),
        'A'...'Z' => @enumFromInt(@intFromEnum(KeyStroke.a) + (char - 'A')),
        '0'...'9' => @enumFromInt(@intFromEnum(KeyStroke.num0) + (char - '0')),
        ' ' => .space,
        '\t' => .tab,
        '\n' => .newline,
        '\r' => .carriage_return,
        '!' => .exclamation,
        '"' => .double_quote,
        '#' => .hash,
        '$' => .dollar,
        '%' => .percent,
        '&' => .ampersand,
        '\'' => .single_quote,
        '(' => .open_paren,
        ')' => .close_paren,
        '*' => .asterisk,
        '+' => .plus,
        ',' => .comma,
        '-' => .minus,
        '.' => .dot,
        '/' => .slash,
        ':' => .colon,
        ';' => .semicolon,
        '<' => .less_than,
        '=' => .equals,
        '>' => .greater_than,
        '?' => .question,
        '@' => .at,
        '[' => .open_bracket,
        '\\' => .backslash,
        ']' => .close_bracket,
        '^' => .caret,
        '_' => .underscore,
        '`' => .backtick,
        '{' => .open_brace,
        '|' => .pipe,
        '}' => .close_brace,
        '~' => .tilde,
        else => null,
    };
}

pub fn sleep(ms: u64) void {
    std.Thread.sleep(ms * std.time.ns_per_ms);
}

pub fn keystrokeRequiresShift(key: KeyStroke) bool {
    return switch (key) {
        .exclamation, .double_quote, .hash, .dollar, .percent, .ampersand, .open_paren, .close_paren, .asterisk, .plus, .colon, .less_than, .greater_than, .question, .at, .caret, .underscore, .open_brace, .pipe, .close_brace, .tilde => true,
        else => false,
    };
}

pub fn press(key: KeyStroke) void {
    keyDown(key);
    std.Thread.sleep(10 * std.time.ns_per_ms);
    keyUp(key);
}

pub fn keyDown(key: KeyStroke) void {
    const keyCode = keystrokeToKeyCode(key);
    const requiresShift = keystrokeRequiresShift(key);

    if (requiresShift) {
        const shiftDown = c.CGEventCreateKeyboardEvent(null, keystrokeToKeyCode(.shift), true);
        if (shiftDown) |e| {
            c.CGEventPost(c.kCGHIDEventTap, e);
            c.CFRelease(e);
        }
        std.Thread.sleep(1 * std.time.ns_per_ms);
    }

    const event = c.CGEventCreateKeyboardEvent(
        null,
        keyCode,
        true,
    );
    if (event) |e| {
        c.CGEventPost(c.kCGHIDEventTap, e);
        c.CFRelease(e);
    }
}

pub fn keyUp(key: KeyStroke) void {
    const keyCode = keystrokeToKeyCode(key);
    const requiresShift = keystrokeRequiresShift(key);

    const event = c.CGEventCreateKeyboardEvent(
        null,
        keyCode,
        false,
    );
    if (event) |e| {
        c.CGEventPost(c.kCGHIDEventTap, e);
        c.CFRelease(e);
    }

    if (requiresShift) {
        std.Thread.sleep(1 * std.time.ns_per_ms);
        const shiftUp = c.CGEventCreateKeyboardEvent(
            null,
            keystrokeToKeyCode(.shift),
            false,
        );
        if (shiftUp) |e| {
            c.CGEventPost(c.kCGHIDEventTap, e);
            c.CFRelease(e);
        }
    }
}

pub fn write(text: []const u8) void {
    for (text) |char| {
        const key = charToKeystroke(char);
        if (key) |k| {
            press(k);
            std.Thread.sleep(5 * std.time.ns_per_ms);
        }
    }
}

pub fn hold(holdKey: KeyStroke, keys: []const KeyStroke) void {
    keyDown(holdKey);
    std.Thread.sleep(10 * std.time.ns_per_ms);

    for (keys) |key| {
        press(key);
        std.Thread.sleep(5 * std.time.ns_per_ms);
    }

    std.Thread.sleep(10 * std.time.ns_per_ms);
    keyUp(holdKey);
}

pub fn hotkey(keys: []const KeyStroke) void {
    for (keys) |key| {
        keyDown(key);
        std.Thread.sleep(1 * std.time.ns_per_ms);
    }

    std.Thread.sleep(10 * std.time.ns_per_ms);

    var i = keys.len;
    while (i > 0) {
        i -= 1;
        keyUp(keys[i]);
        std.Thread.sleep(1 * std.time.ns_per_ms);
    }
}

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
    click(x, y);
    click(x, y);
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

pub fn displaySize() DisplySize {
    const id = c.CGMainDisplayID();
    const w = c.CGDisplayPixelsWide(id);
    const h = c.CGDisplayPixelsHigh(id);

    return DisplySize{
        .width = @intCast(w),
        .height = @intCast(h),
    };
}

const MV_TEST = false;
const POS_TEST = false;
const CLICK_TEST = false;
const AUTO_TEST = false;
const DISP_TEST = true;

const INFO_TEST = false;

test "mouse movement" {
    if (MV_TEST) {
        moveMouseToPosition(MousePosition{
            .x = 10,
            .y = 10,
        });
    }
}

test "mouse position" {
    if (POS_TEST) {
        const pos = getMouse();
        std.debug.print("x : {d} , y : {d}", .{
            pos.x,
            pos.y,
        });
    }
}

test "click" {
    if (CLICK_TEST) {
        const pos = MousePosition{
            .x = 70,
            .y = 136,
        };

        moveMouseToPosition(pos);
        std.Thread.sleep(500 * std.time.ns_per_ms);
        click(pos.x, pos.y);
    }
}

test "go to google" {
    if (AUTO_TEST) {
        const searchBarPos = MousePosition{
            .x = 170,
            .y = 100,
        };

        moveMouseToPosition(searchBarPos);
        sleep(100);

        click(searchBarPos.x, searchBarPos.y);
        sleep(100);

        write("google.com");
        sleep(1000);

        press(.enter);
    }
}

test "display size" {
    if (DISP_TEST) {
        const size = displaySize();
        std.debug.print("{d}x{d}", .{
            size.width,
            size.height,
        });
    }
}
