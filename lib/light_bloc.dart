// lib/light_bloc.dart

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// States
abstract class LightState extends Equatable {
  const LightState();
  
  @override
  List<Object> get props => [];
}

class LightOn extends LightState {}

class LightOff extends LightState {}

// Events
abstract class LightEvent extends Equatable {
  const LightEvent();
  
  @override
  List<Object> get props => [];
}

class ToggleLight extends LightEvent {}

// Bloc
class LightBloc extends Bloc<LightEvent, LightState> {
  LightBloc() : super(LightOff()) {
    on<ToggleLight>((event, emit) {
      if (state is LightOff) {
        emit(LightOn());
      } else {
        emit(LightOff());
      }
    });
  }
}
