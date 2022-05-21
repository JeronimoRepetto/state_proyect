import 'dart:async';

import 'package:states/model/user.dart';

class _UserService {
  final StreamController<User> _userStreamController =
      StreamController<User>.broadcast();

  User? _user;
  User? get user => _user;

  Stream<User> get userStream => _userStreamController.stream;
  bool get userExist => (_user != null) ? true : false;

  void setUser(User user) {
    _user = user;
    _userStreamController.add(_user!);
  }

  void changeAge(int edad) {
    _user!.edad = edad;
    _userStreamController.add(_user!);
  }

  dispose(){
    _userStreamController.close();
  }
}

final userService = _UserService();
