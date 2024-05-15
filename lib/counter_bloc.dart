import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


/// ********************** States
abstract class CounterState extends Equatable {
  const CounterState();

  @override
  List<Object> get props => [];
}

class CounterInitial extends CounterState {
  final int counterValue;

  const CounterInitial(this.counterValue);

  @override
  List<Object> get props => [counterValue];
}

class CounterValueChanged extends CounterState {
  final int counterValue;

  const CounterValueChanged(this.counterValue);

  @override
  List<Object> get props => [counterValue];
}


/// ***************************** Events
abstract class CounterEvent extends Equatable {
  const CounterEvent();

  @override
  List<Object> get props => [];
}

class IncrementCounter extends CounterEvent {}

class DecrementCounter extends CounterEvent {}

/// ************************* Bloc

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial(0)) {
    on<IncrementCounter>((event, emit) {
      final newValue = (state as CounterInitial).counterValue + 1;
      emit(CounterValueChanged(newValue));
    });

    on<DecrementCounter>((event, emit) {
      final newValue = (state as CounterInitial).counterValue - 1;
      emit(CounterValueChanged(newValue));
    });
  }
}