## Automac

lightweight macOS automation toolkit in zig, inspired by pyautogui

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

### Plans

- [ ] screenshot functions
- [ ] image position detection with opencv
