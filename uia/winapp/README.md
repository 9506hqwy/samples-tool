# winapp CLI

Download binary from GitHub Release, and extract zip.

```sh
winapp --version
```

```text
0.7.1
```

## UI Automation

### status

Get application information.

```sh
winapp ui status -a notepad
```

```text
Process: Notepad
PID: 11224
Window: タイトルなし - メモ帳
HWND: 329168
Connected to Notepad (PID 11224)
```

### inspect

Inspect application UI element.

```sh
winapp ui inspect -a notepad
```

```text
win-4ab7 Window "タイトルなし - メモ帳" (1094,180 769x571)
  pn-48cf Pane (1100,255 757x458)
    doc-4a9b Document "テキスト エディター" (1100,255 757x458)
      :
      :
```

- automationId(`File` etc) / Semantic slug(`type-name-hash`) / hash(`type-hash`)
- type
- name
- status `[off]`, `[collapsed]`, `[offscreen]`

### search

Search UI element.

```sh
winapp ui search button -a notepad
```

```text
  CloseButton Button "タブを閉じる" (1349,194 32x24)
  AddButton Button "新しいタブの追加" (1393,196 32x24)
    :
    :
Found 7 matches
```

### get-property

Get UI element property.

```sh
winapp.exe ui get-property File -a notepad
```

```text
  Name: ファイル
  AutomationId: File
  ControlType: MenuItem
  ClassName: Microsoft.UI.Xaml.Controls.MenuBarItem
  IsEnabled: True
  IsOffscreen: False
  BoundingRectangle: 1141,212,60,32
  HasKeyboardFocus: False
  IsKeyboardFocusable: True
  AccessKey: Alt, F
  IsPassword: False
  ExpandCollapseState: Collapsed
  FontWeight: Unavailable
  FontName: Unavailable
  FontSize: Unavailable
  ForegroundColor: Unavailable
  IsItalic: Unavailable
  StrikethroughStyle: Unavailable
mnu-file-38d8: 18 properties
```

### get-value

Get value of UI element.

```sh
winapp.exe ui get-value doc-4a9b -a notepad
```

```text
こんにちは
```

### screenshot

Capture screenshot.

```sh
winapp.exe ui screenshot -a notepad -o a.png
```

```text
Screenshot of "タイトルなし - メモ帳" (PID 11224) saved to G:\winappcli-x64\a.png (759x566, 14KB)
```

### record

Record the application in MP4 format.

```sh
winapp.exe ui record -a notepad --duration-sec 10 --fps 10
```

```text
Recording "*Hello, World! - メモ帳" (PID 11224) to G:\winappcli-x64\recording-20261027-003903-d131d58eb63e477d8abf96c80ca0d615.mp4 — until 10s, 10 fps…
Recorded 100 frames (760x566, h264) to G:\winappcli-x64\recording-20261027-003903-d131d58eb63e477d8abf96c80ca0d615.mp4 (62KB)
```

### invoke

Open `File` menu.

```sh
winapp.exe ui invoke File -a notepad --action expand
```

```text
Requested expand on mnu-file-38d8; performed expand via ExpandCollapsePattern
```

### click

Move mouse pointer to `File` menu and click `File` menu.

```sh
winapp.exe ui click mnu-file-38d8 -a notepad
```

```text
✅ click on mnu-file-38d8 at (1171, 228)
```

### drag

TODO

### touch

TODO

### pen

TODO

### hover

Move mouse pointer to `File` menu.

```sh
winapp.exe ui hover File -a notepad
```

```text
✅ Hovered on mnu-file-38d8 at (1171, 228) — dwelled 800ms
```

### send-keys

Focus text area and input text.

```sh
winapp.exe ui send-keys text="こんにちは" -a notepad --target doc-4a9b --via send-input
```

```text
✅ Sent 1 key action(s) via send-input
```

### set-value

Input text.

```sh
winapp.exe ui set-value doc-4a9b "Hello, World!" -a notepad
```

```text
Set value on doc-4a9b
```

### focus

Focus text area.

```sh
winapp.exe ui focus doc-4a9b -a notepad
```

```text
Focused doc-4a9b
```

### scroll-into-view

TODO

### scroll

TODO

### wait-for

Wait for disapper `File` menu.

```sh
winapp.exe ui wait-for File -a notepad --gone --timeout 10
```

```text
[ERROR] - 'File' not found after 10ms
```

### list-windows

list exist windows.

```sh
winapp ui list-windows
```

```text
  HWND 262490: "コマンド プロンプト - winapp  ui list-windows " (window, 1740x958, foreground) [CASCADIA_HOSTING_WINDOW_CLASS] (WindowsTerminal, PID 5012)
  HWND 329168: "タイトルなし - メモ帳" (window, 769x571) [Notepad] (Notepad, PID 11224)
    :
    :
```

### get-focused

Get UI element that is focused by keyboard.

```sh
winapp.exe ui get-focused -a notepad
```

```text
No element has keyboard focus in this app
```

### yield

TODO

## References

- [Windows App Development CLI (winapp CLI)](https://learn.microsoft.com/en-us/windows/apps/dev-tools/winapp-cli/)
- [winappCli](https://github.com/microsoft/winappcli)
