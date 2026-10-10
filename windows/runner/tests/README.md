# Native runner visibility regression test

Run from a Visual Studio x64 developer command prompt at the repository root:

```bat
cmake -S windows/runner/tests -B build/runner-tests -G Ninja
cmake --build build/runner-tests
ctest --test-dir build/runner-tests --output-on-failure
```

Requires the Windows SDK, MSVC and CMake. Flutter is not required for this
standalone test: the harness supplies only the monitor DPI function. It compiles
the real runner and uses real Windows parent/child windows positioned offscreen.

The test checks that attaching content does not show the parent prematurely,
and that a hidden child becomes visible when the runner is shown. It also covers
showing the parent directly (as window_manager can do), showing an already-visible
runner again, and attaching content after the parent is visible.

The unchanged runner fails with `first show left the content hidden`. This
reproduces the observed native-window state, not the unknown upstream trigger
that originally hid the Flutter view. A full application startup test is still
needed to validate the fix against Flutter and the registered plugins.
