#! /usr/bin/env python3

from contextlib import ContextDecorator
import time
import inspect


class ContextExample(ContextDecorator):
    def __enter__(self):
        self.start = time.time()
        print("Starting")
        return self

    def __exit__(self, *exc):
        exec_time = time.time() - self.start
        print(f"Finished in {exec_time:.2f} seconds")
        return False

    def __call__(self, func):
        def wrapper(*args, **kwargs):
            source = inspect.getsource(func)
            print(f"Source code of the function: {source}")
            with self as ctx:
                return func(*args, **kwargs)

        return wrapper


@ContextExample()
def say_hello():
    print("Hello, world!")


if __name__ == "__main__":
    print("======Using the context manager======")
    with ContextExample() as ctx:
        print("Inside the context")

    print("======Using the decorator======")
    say_hello()
