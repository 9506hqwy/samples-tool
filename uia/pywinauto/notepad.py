# /// script
# requires-python = ">=3.14"
# dependencies = [
#   "pillow",
#   "pywinauto",
# ]
# ///

import time

from pywinauto import Application, Desktop

# アプリケーションを起動する。
Application().start("notepad.exe", timeout=3)

# 別プロセスのためアプリケーションを取得する。
app = Desktop(backend="uia", allow_magic_lookup=False)
win = app.window(title_re="タイトルなし")

# 「ファイル」メニューを選択する。
menu_file = win.child_window(title="ファイル", control_type="MenuItem")
menu_file.select()

# アニメーションが完了するまで待ってスクリーンキャプチャを採取する。
time.sleep(1)
img = win.capture_as_image()
img.save("notepad-helloworld-menu.png")

# 「新しいタブ」メニューを選択する。
menu_new_tab = win.child_window(title="新しいタブ", control_type="MenuItem")
menu_new_tab.select()

# テキストを入力する。
doc = win.child_window(control_type="Document")
doc.type_keys("こんにちは！")

# ウィンドウタイトルが変更されるため再取得する。
win = app.window(title="*こんにちは！ - メモ帳")

# 閉じる。
close = win.child_window(title="閉じる", control_type="Button")
close.click()

# アニメーションが完了するまで待ってスクリーンキャプチャを採取する。
time.sleep(1)
img = win.capture_as_image()
img.save("notepad-helloworld-closing.png")

# 保存しない。
close = win.child_window(title="保存しない", control_type="Button")
close.click()
