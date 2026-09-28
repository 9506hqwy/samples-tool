#!/usr/bin/env python3
# /// script
# dependencies = [
#   "tui-test",
# ]
# requires-python = ">=3.14"
# ///

import unittest
from tui_test import TuiTest


class TestClass(unittest.IsolatedAsyncioTestCase):
    async def test_basic_01(self):
        async with TuiTest.ephemeral() as terminal:
            await terminal.run("bash", "-c", "echo 'Hello, World!'")
            await terminal.get_by_text("Hello, World!").expect()
            await terminal.screenshot("01-basic-01.svg")

    async def test_basic_02(self):
        async with TuiTest.ephemeral() as terminal:
            await terminal.run("bash", "-c", "echo 'Hello, World!'")
            await terminal.get_by_text("unknown").expect()
            await terminal.screenshot("01-basic-02.svg")


if __name__ == "__main__":
    unittest.main()
