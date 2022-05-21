part of 'user_cubit.dart';

@immutable
abstract class UserSate {}

class UserInit extends UserSate {
  final userExist = false;

  @override
  String toString() {
    // TODO: implement toString
    return "Estado de usuario inicial: $userExist";
  }
}

class ActiveUser extends UserSate {
  final userExist = true;
  final User user;

  ActiveUser(this.user);

  @override
  String toString() {
    // TODO: implement toString
    return "Estado de usuario activo: $userExist";
  }
}
