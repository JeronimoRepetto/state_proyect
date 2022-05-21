import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:states/controller/user_controller.dart';
import 'package:states/model/user.dart';
import 'package:states/pages/page_two.dart';

class PageOnePage extends StatelessWidget {
  const PageOnePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userCtrl = Get.put(UserController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina 1'),
      ),
      body: Obx(() => userCtrl.userExist.value
          ? InformacionUsuario(userCtrl.user.value)
          : const Center(
              child: Text('No hay informacion del usuario'),
            )),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.forward),
          //onPressed: () => Navigator.pushNamed(context, 'page_two'),
          onPressed: () => Get.toNamed('page_two', arguments: {
                'nombre': 'Jeronimo',
                'edad': 30,
              })),
    );
  }
}

class InformacionUsuario extends StatelessWidget {
  final User user;

  const InformacionUsuario(this.user);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'General',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const Divider(),
          ListTile(
            title: Text("Nombre: ${user.nombre}"),
          ),
          ListTile(
            title: Text("Edad: ${user.edad}"),
          ),
          const Text(
            'Profesiones',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const Divider(),
          ...user.profesiones!
              .map((e) => ListTile(
                    title: Text(e),
                  ))
              .toList()
        ],
      ),
    );
  }
}
