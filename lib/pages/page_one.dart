import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:states/model/user.dart';
import 'package:states/services/user_service.dart';

class PageOnePage extends StatelessWidget {
  const PageOnePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userService = Provider.of<UserService>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina 1'),
        actions: [
          IconButton(
              onPressed: () {
                if (userService.userExist) userService.removeUser();
              },
              icon: const Icon(Icons.exit_to_app, color: Colors.red))
        ],
      ),
      body: userService.userExist
          ? InformacionUsuario(userService.user!)
          : const Center(
              child: Text("No hay usuario seleccionado"),
            ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.forward),
        onPressed: () => Navigator.pushNamed(context, 'page_two'),
      ),
    );
  }
}

class InformacionUsuario extends StatelessWidget {
  final User user;

  InformacionUsuario(this.user);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'General',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Divider(),
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
          ...user.profesiones!.map((e) => ListTile(
            title: Text(e),
          )).toList(),
        ],
      ),
    );
  }
}
