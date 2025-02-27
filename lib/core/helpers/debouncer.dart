import 'dart:async';

class Debouncer {
  final int milliseconds;
  Debouncer({required this.milliseconds});
  Timer? _timer;

  void run(void Function() action) {
    if (_timer != null) {
      _timer?.cancel();
    }
    _timer = Timer(const Duration(milliseconds: 500), () {
      action();
    });
  }
}
