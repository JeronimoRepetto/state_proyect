import 'package:get/get.dart';
import 'package:states/model/user.dart';

class UserController extends GetxController {
  var userExist = false.obs;
  var user = new User().obs;

  void setUser(User user) {
    userExist.value = true;
    this.user.value = user;
  }

  void changeAge(int age) {
    if (userExist.value) {
      user.update((val) {
        val!.edad = age;
      });
    }
  }

  void addProfession(String profession) {
    if (userExist.value) {
      user.update((val) {
        val!.profesiones!.add(profession);
      });
    }
  }
}
