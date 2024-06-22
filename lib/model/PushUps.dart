import 'package:flutter_bloc/flutter_bloc.dart';

enum PushUpState { neutral, init, complete }

class PushUpCounter extends Cubit<PushUpState> {
  PushUpCounter() : super(PushUpState.neutral);
  int count = 0;
  void setPushUpState(PushUpState current) {
    emit(current);
  }

  void increment() {
    count++;
    emit(state);
  }

  void reset() {
    count = 0;
    emit(state);
  }
}
