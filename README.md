## Automac

lightweight macOS automation toolkit in zig, inspired by pyautogui

### Install

Install with `zig fetch`, this should only work with macOS, depends on `CoreGraphics` and `CoreFoundation`

```
zig fetch --save git+https://github.com/pacifio/automac#main
```

Then add this in your `builz.zig` file

```zig
const automac_dep = b.dependency("automac", .{});
exe.root_module.addImport("automac", automac_dep.module("automac"));
```

---

### Display Functions

```
displaySize() -> DisplySize
```

---

### Keyboard Functions

```
keystrokeToKeyCode(key: KeyStroke) -> c.CGKeyCode
charToKeystroke(char: u8) -> ?KeyStroke
keystrokeRequiresShift(key: KeyStroke) -> bool
press(key: KeyStroke) -> void
keyDown(key: KeyStroke) -> void
keyUp(key: KeyStroke) -> void
write(text: []const u8) -> void
hold(holdKey: KeyStroke, keys: []const KeyStroke) -> void
hotkey(keys: []const KeyStroke) -> void
```

---

### Mouse Functions

```
getMouse() -> MousePosition
moveMouse(x: f64, y: f64) -> void
moveMouseToPosition(pos: MousePosition) -> void
clickInternal(x: i32, y: i32, button: c.CGMouseButton, down_event: c.CGEventType, up_event: c.CGEventType) -> void
click(x: i32, y: i32) -> void
leftClick(x: i32, y: i32) -> void
rightClick(x: i32, y: i32) -> void
middleClick(x: i32, y: i32) -> void
doubleClick(x: i32, y: i32) -> void
drag(starting: MousePosition, ending: MousePosition, duration: u64, mouseButton: ?c.CGMouseButton) -> void
```

---

### Utils

```
sleep(ms: u64) -> void
```

### Examples

```zig
const std = @import("std");
const automac = @import("automac");

pub fn mouseMoveExample() void {
    automac.moveMouseToPosition(automac.MousePosition{
        .x = 10,
        .y = 10,
    });
}

pub fn mouseCurrentPostion() void {
    const pos = automac.getMouse();
    std.debug.print("x : {d} , y : {d}", .{
        pos.x,
        pos.y,
    });
}

pub fn mouseClickExample() void {
    const pos = automac.MousePosition{
        .x = 70,
        .y = 136,
    };

    automac.moveMouseToPosition(pos);
    automac.sleep(500);
    automac.click(pos.x, pos.y);
}

pub fn typingExample() void {
    const searchBarPos = automac.MousePosition{
        .x = 170,
        .y = 100,
    };

    automac.moveMouseToPosition(searchBarPos);
    automac.sleep(100);

    automac.click(searchBarPos.x, searchBarPos.y);
    automac.sleep(100);

    automac.write("google.com");
    automac.sleep(1000);

    automac.press(.enter);
}

pub fn screenSizeExample() void {
    const size = automac.displaySize();
    std.debug.print("{d}x{d}", .{
        size.width,
        size.height,
    });
}

```

### Plans

- [ ] add proper documentation
- [ ] screenshot functions
- [ ] image position detection with opencv
- [ ] autolinux - variant for linux
