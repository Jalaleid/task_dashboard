// import 'dart:async';

// import 'package:flutter_bloc/flutter_bloc.dart';

// import 'states.dart';

// class TimerCubit extends Cubit<TimerState> {
//   TimerCubit()
//       : super(const TimerState(duration: Duration.zero, isRunning: false));

//   final Duration _tickDuration = const Duration(seconds: 1);

//   Timer? _timer;

//   void startTimer() {
//     if (_timer?.isActive ?? false) {
//       return; // Timer already running
//     }

//     _timer = Timer.periodic(_tickDuration, (timer) {
//       final newDuration = state.duration + _tickDuration;
//       emit(TimerState(duration: newDuration, isRunning: true));
//     });
//   }

//   void stopTimer() {
//     if (_timer?.isActive ?? false) {
//       _timer?.cancel();
//       emit(state.copyWith(isRunning: false));
//     }
//   }

//   void resetTimer() {
//     stopTimer();
//     emit(const TimerState(duration: Duration.zero, isRunning: false));
//   }

//   @override
//   void onClose() {
//     super.close();
//     stopTimer(); // Ensure timer is always canceled when Cubit is disposed
//   }
// }

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

import 'timer_states.dart';

class TimerCubit extends Cubit<TimerStates> {
  TimerCubit() : super(InitTimerState());

  int timerPerSec = 0;
  int timerPerMin = 0;
  int timerPerHour = 0;
  bool isRunning = false;
  bool stop = false;
  bool isAvailabe = true;

  void timerStart() {
    isAvailabe = false;
    emit(StartTimerState());

    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (isRunning) {
        if (timerPerSec >= 59) {
          timerPerSec = 0;
          timerPerMin++;
        }
        if (timerPerMin >= 59) {
          timerPerMin = 0;
          timerPerHour++;
        }
        timerPerSec++;
        if (kDebugMode) {
          print('incrase timer');
        }
        emit(IncraseTimerState());
      } else if (stop) {
        isAvailabe = true;
        timer.cancel();
        if (kDebugMode) {
          print('cancel timer');
        }
        emit(CancelTimerState());
        timerPerHour = timerPerMin = timerPerSec = 0;
      }
    });
  }
}
