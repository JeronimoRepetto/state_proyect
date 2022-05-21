import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:states/model/user.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserSate> {
  UserCubit() : super(UserInit());

  void selectUser(User user) {
    emit(ActiveUser(user));
  }

  void changeAge(int edad) {
    final currentState = state;
    if (currentState is ActiveUser) {
      final newUser = currentState.user.copyWith(edad: 35);
      emit(ActiveUser(newUser));
    }
  }

  void addProfession(String profession) {
    final currentState = state;
    if (currentState is ActiveUser) {
      List<String> professions = currentState.user.profesiones!;
      professions.add(profession);
      final newUser = currentState.user.copyWith(profesiones: professions);
      emit(ActiveUser(newUser));
    }
  }

  void logout() => emit(UserInit());
}
