## Ray

### ray.remote internals
Python装饰器
```
@ray.remote
def f(x):
    return x + 1
```
等价于
```
f = ray.remote(f)
```

内部实现：
- @ray.remote
- ray/__init__.py: from ray._private.worker import remote
- ray/_private/worker.py: def remote(function, *args, **kwargs):  call ray.remote_function.RemoteFunction
```
def _make_remote(function_or_class, options):
    if not function_or_class.__module__:
        function_or_class.__module__ = "global"

    if inspect.isfunction(function_or_class) or is_cython(function_or_class):
        ray_option_utils.validate_task_options(options, in_options=False)
        return ray.remote_function.RemoteFunction(
            Language.PYTHON,
            function_or_class,
            None,
            options,
        )
```
- python/ray/remote_function.py: RemoteFunction

https://tddg.github.io/ds5110-cs5501-spring24/assets/docs/lec6b-ray-internals.pdf

### References
- [Ray documentation](https://docs.ray.io/en/latest/)
- https://github.com/ray-project/ray-educational-materials