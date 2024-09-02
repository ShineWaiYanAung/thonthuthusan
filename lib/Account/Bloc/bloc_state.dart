// counter_state.dart

abstract class CounterState {}

class CounterInitial extends CounterState {
  final int counter;

  CounterInitial({required this.counter});
}

class CounterChanged extends CounterState {
  final int counter;

  CounterChanged({required this.counter});
}
