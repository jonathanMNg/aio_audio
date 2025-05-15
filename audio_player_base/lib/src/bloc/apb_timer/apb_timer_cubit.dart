import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


ValueNotifier<DateTime?>? sleepTimer;
class ApbTimerCubit extends Cubit<Duration> {

  StreamSubscription<Duration>? _tickerSubscription;
  ApbTimerCubit() : super(Duration.zero);

  Future<void> startTimer(Duration duration) async {
    emit(duration);
    await _reset();
    sleepTimer = ValueNotifier(DateTime.now().add(duration));
    _tickerSubscription ??= Stream.periodic(
      const Duration(seconds: 1),
          (x) => sleepTimer!.value!.difference(DateTime.now()),
    )
        .takeWhile((diff) => diff > Duration.zero).listen(
          (remaining) => emit(remaining),
      onDone: () => emit(Duration.zero), // Player Position stream will handle stop timer
    );
  }

  Future<void> _reset() async {
    await _tickerSubscription?.cancel();
    _tickerSubscription = null;
    sleepTimer?.value = null;
    sleepTimer = null;
  }

  Future<void> stopTimer() async {
    await _reset();
    emit(Duration.zero);
  }

  @override
  Future<void> close() {
    stopTimer();
    return super.close();
  }
}
