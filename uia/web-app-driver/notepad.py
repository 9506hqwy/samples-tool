# /// script
# requires-python = ">=3.14"
# dependencies = [
#   "selenium<4",
# ]
# ///

import time

from selenium import webdriver
from selenium.webdriver.remote.remote_connection import RemoteConnection

# `socket._GLOBAL_DEFAULT_TIMEOUT` is not int or float.
# Error:
# ValueError: Timeout value connect was <object object at 0x000001DC120D0650>,
# but it must be an int, float or None.
RemoteConnection.set_timeout(60)

desired_caps = {}
desired_caps["app"] = "notepad.exe"
driver = webdriver.Remote(
    command_executor="http://127.0.0.1:4723", desired_capabilities=desired_caps
)

# 「ファイル」メニューを選択する。
driver.find_element_by_name("ファイル").click()

# アニメーションが完了するまで待ってスクリーンキャプチャを採取する。
time.sleep(1)
driver.save_screenshot("notepad-helloworld-menu.png")

# 「新しいタブ」メニューを選択する。
driver.find_element_by_name("新しいタブ").click()

# テキストを入力する。
doc = driver.find_element_by_xpath('//Document[@LocalizedControlType="ドキュメント"]')
doc.send_keys("こんにちは！")

# 閉じる。
driver.find_element_by_name("閉じる").click()

# アニメーションが完了するまで待ってスクリーンキャプチャを採取する。
time.sleep(1)
driver.save_screenshot("notepad-helloworld-closing.png")

# 保存しない。
driver.find_element_by_name("保存しない").click()

driver.quit()
