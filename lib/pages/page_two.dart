import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:states/bloc/user/user_cubit.dart';
import 'package:states/model/user.dart';

class PageTwoPage extends StatelessWidget {
  const PageTwoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userCubit = context.read<UserCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina 2'),
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
                userCubit.selectUser(User(
                    nombre: 'Jeronimo',
                    edad: 30,
                    profesiones: ['Dar dev', "Gamer"]));
              }),
          MaterialButton(
              color: Colors.blue,
              child: const Text(
                'Cambiar Edad',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                userCubit.changeAge(35);
              }),
          MaterialButton(
              color: Colors.blue,
              child: const Text(
                'Añadir Profesion',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                if (userCubit.state is ActiveUser) {
                  userCubit.addProfession(
                      'Profesion ${(userCubit.state as ActiveUser).user.profesiones!.length + 1}');
                }
              }),
        ],
      )),
    );
  }
}
