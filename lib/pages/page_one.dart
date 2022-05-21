import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:states/bloc/user/user_cubit.dart';

import '../model/user.dart';

class PageOnePage extends StatelessWidget {
  const PageOnePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina 1'),
        actions: [
          IconButton(
              onPressed: () => context.read<UserCubit>().logout(),
              icon: const Icon(Icons.logout, color: Colors.red))
        ],
      ),
      body: BodyScaffold(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.forward),
        onPressed: () => Navigator.pushNamed(context, 'page_two'),
      ),
    );
  }
}

class BodyScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocBuilder<UserCubit, UserSate>(builder: (_, state) {
      print(state);
      switch (state.runtimeType) {

        ///if (state is UserInit) {
        case UserInit:

          ///  return const Center(
          return const Center(
            ///    child: Text("No hay informacion del usuario"),
            child: Text("No hay informacion del usuario"),

            ///  );
          );

        ///} else if (state is ActiveUser) {
        case ActiveUser:

          ///  return InformacionUsuario(state.user);
          return InformacionUsuario((state as ActiveUser).user);

        ///} else {
        default:

          ///  return const Center(
          return const Center(
            ///    child: Text("Estado no reconocido"),
            child: Text("Estado no reconocido"),

            ///  );
          );

        ///}
      }
    });
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
          Text(
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
          Text(
            'Profesiones',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Divider(),
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
