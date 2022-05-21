import 'package:flutter/material.dart';
import 'package:states/model/user.dart';
import 'package:states/services/user_service.dart';

class PageOnePage extends StatelessWidget {
  const PageOnePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina 1'),
      ),
      body: StreamBuilder(
        stream: userService.userStream,
        builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
          return snapshot.hasData
              ? InformacionUsuario(snapshot.data)
              : const Center(
            child: Text('No hay informacion del usuario'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.forward),
        onPressed: () => Navigator.pushNamed(context, 'page_two'),
      ),
    );
  }
}

class InformacionUsuario extends StatelessWidget {
  final User? user;

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
          Divider(),
          ListTile(
            title: Text("Nombre: ${user!.nombre}"),
          ),
          ListTile(
            title: Text("Edad: ${user!.edad} "),
          ),
          const Text(
            'Profesiones',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const Divider(),
          const ListTile(
            title: Text("Profesion 1: "),
          ),
          const ListTile(
            title: Text("Profesion 2: "),
          ),
          const ListTile(
            title: Text("Profesion 3: "),
          ),
        ],
      ),
    );
  }
}
