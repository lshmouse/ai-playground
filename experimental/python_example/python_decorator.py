#! /usr/bin/env python3

import time
from inspect import getsource


def timer(func):
    def wrapper(*args, **kwargs):
        start = time.time()
        ret = func(*args, **kwargs)
        end = time.time()
        exec_time = end - start
        print(f"Function {func.__name__} took {exec_time:.2f} seconds to execute")
        return ret

    return wrapper


def tracing(func):
    def wrapper(*args, **kwargs):
        print("Something is happening before the function is called.")
        print(f"Function name: {func.__name__}")
        print(f"Arguments: {args}")
        # print(f"Keyword arguments: {kwargs}")
        source = getsource(func)
        print(f"Source code: {source[9:]}")
        ret = func(*args, **kwargs)
        # ret = eval(source[9:])(*args, **kwargs)
        print("Something is happening after the function is called.")
        return ret

    return wrapper


@tracing
@timer
def say_hello(name):
    print("hello: " + name)


if __name__ == "__main__":
    say_hello("world")
