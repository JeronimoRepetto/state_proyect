import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:states/services/user_service.dart';

import '../model/user.dart';

class PageTwoPage extends StatelessWidget {
  const PageTwoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userService = Provider.of<UserService>(context);
    return Scaffold(
      appBar: AppBar(
        title: userService.userExist
            ? Text("Nombre: ${userService.user!.nombre}")
            : const Text('Pagina 2'),
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
                userService.setUser(User(
                    nombre: "Jeronimo",
                    edad: 30,
                    profesiones: [
                      "Dart developer",
                      "Full Stack Dev",
                      "Tech Lead"
                    ]));
              }),
          MaterialButton(
              color: Colors.blue,
              child: const Text(
                'Cambiar Edad',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                userService.setAge(35);
              }),
          MaterialButton(
              color: Colors.blue,
              child: const Text(
                'Añadir Profesion',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                userService.addProfesion();
              }),
        ],
      )),
    );
  }
}
