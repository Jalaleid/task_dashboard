// import 'package:flutter/material.dart';

// @immutable
// class TimerState {
//   final Duration duration;
//   final bool isRunning;

//   const TimerState({required this.duration, required this.isRunning});

//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is TimerState &&
//           runtimeType == other.runtimeType &&
//           duration == other.duration &&
//           isRunning == other.isRunning;

//   @override
//   int get hashCode => Object.hash(duration, isRunning);

//   TimerState copyWith({Duration? duration, bool? isRunning}) {
//     return TimerState(
//       duration: duration ?? this.duration,
//       isRunning: isRunning ?? this.isRunning,
//     );
//   }
// }

abstract class TimerStates {}

class InitTimerState extends TimerStates {}

class StartTimerState extends TimerStates {}

class IncraseTimerState extends TimerStates {}

class ResetTimerState extends TimerStates {}

class CancelTimerState extends TimerStates {}
