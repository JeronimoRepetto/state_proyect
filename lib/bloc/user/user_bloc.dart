import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../model/user.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(const UserInitial()) {
    on<ActivateUser>((event, emit) => emit(UserSetState(event.user)));
    on<ChangeUserAge>((event, emit) {
      if (!state.existUser) return;
      User newUser = state.user!.copyWith(edad: event.age);
      emit(UserSetState(newUser));
    });
    on<AddUserProfessions>((event, emit) {
      if (!state.existUser) return;
      User newUser = state.user!.copyWith(
          profesiones: [...state.user!.profesiones!, event.profession]);
      emit(UserSetState(newUser));
    });
    on<Logout>((event, emit) => emit(const UserInitial()));
  }
}
