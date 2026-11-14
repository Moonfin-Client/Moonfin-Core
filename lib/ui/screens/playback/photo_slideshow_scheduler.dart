import 'dart:async';

/// Drives a photo slideshow one photo at a time.
///
/// Each photo's countdown starts only once that photo has finished loading,
/// so [interval] is how long a photo stays on screen rather than how long it
/// has to download, decode and show. A photo that fails to load still gets
/// its full [interval] (showing the error state) before the slideshow moves
/// on, so a broken photo never stalls it.
class PhotoSlideshowScheduler {
  PhotoSlideshowScheduler({required this.interval, required this.onAdvance});

  final Duration interval;

  /// Called when the current photo has been visible for [interval]. The
  /// owner moves to the next photo and reports it through [photoChanged].
  final void Function() onAdvance;

  Timer? _timer;
  int _generation = 0;
  bool _running = false;

  bool get isRunning => _running;

  /// Starts the slideshow on the current photo. [ready] completes once that
  /// photo is on screen.
  void start(Future<void> ready) {
    _running = true;
    photoChanged(ready);
  }

  void stop() {
    _running = false;
    _generation++;
    _timer?.cancel();
    _timer = null;
  }

  /// Restarts the countdown for a newly shown photo, whether the slideshow
  /// advanced to it or the user skipped to it. The countdown begins when
  /// [ready] completes. A no-op while stopped.
  void photoChanged(Future<void> ready) {
    if (!_running) return;
    _timer?.cancel();
    _timer = null;
    final generation = ++_generation;
    ready.then<void>((_) {}, onError: (Object _) {}).then((_) {
      if (!_running || generation != _generation) return;
      _timer = Timer(interval, onAdvance);
    });
  }

  void dispose() => stop();
}
