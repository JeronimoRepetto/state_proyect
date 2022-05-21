import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:states/controller/user_controller.dart';

import '../model/user.dart';

class PageTwoPage extends StatelessWidget {
  const PageTwoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userCtrl = Get.find<UserController>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina 2'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MaterialButton(
              color: Colors.blue,
              child: const Text(
                'Establcer Usuario',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                userCtrl.setUser(User(
                    nombre: "Jeronimo",
                    edad: 30,
                    profesiones: ["Flutter dev", "Gamer"]));
                Get.snackbar("Exitos", "Se creo el usuario",
                    backgroundColor: Colors.white,
                    colorText: Colors.black87,
                    boxShadows: [
                      const BoxShadow(color: Colors.black, blurRadius: 10)
                    ],
                    duration: Duration(milliseconds: 1000));
              }),
          MaterialButton(
              color: Colors.blue,
              child: const Text(
                'Cambiar Edad',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                userCtrl.changeAge(35);
              }),
          MaterialButton(
              color: Colors.blue,
              child: const Text(
                'Añadir Profesion',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                userCtrl.addProfession(
                    "Profession ${userCtrl.user.value.profesiones!.length + 1}");
              }),
          MaterialButton(
              color: Colors.blue,
              child: const Text(
                'Change Theme',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Get.changeTheme(
                    Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
              }),
        ],
      )),
    );
  }
}
