import 'package:flutter/material.dart';
import 'package:states/model/user.dart';

class UserService with ChangeNotifier {
  User? _user;
  User? get user => _user;
  bool get userExist => _user == null ? false : true;

  void setUser(User user) {
    _user = user;
    notifyListeners();
  }

  void setAge(int age) {
    _user!.edad = age;
    notifyListeners();
  }

  void addProfesion() {
    _user!.profesiones!.add('Profesion ${_user!.profesiones!.length + 1}');
    notifyListeners();
  }

  void removeUser() {
    _user = null;
    notifyListeners();
  }
}
