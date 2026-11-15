"""Sample Application
"""


def Hello(arg1: str, arg2: str):
    """Output Hello, World!

    Args:
        arg1 (str): The first argument.
        arg2 (str): The second argument.
    """
    print(f'Hello, {arg1} and {arg2}!')


def Unknown(arg1: str, arg2: str):
    """Output Hello, World!

    Args:
        arg1 (str): The first argument.
    """
    print(f'Hello, {arg1} and {arg2}!')


if __name__ == "__main__":
    Hello("World", "Universe")
    Unknown("World", "Universe")
