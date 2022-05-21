import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:states/bloc/user/user_bloc.dart';
import 'package:states/model/user.dart';

class PageTwoPage extends StatelessWidget {
  const PageTwoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.of<UserBloc>(context, listen: false);
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
              child: Text(
                'Establcer Usuario',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                userBloc.add(ActivateUser(User(
                    nombre: "Jeronimo",
                    edad: 30,
                    profesiones: ["Dart dev", "Gamer"])));
              }),
          MaterialButton(
              color: Colors.blue,
              child: Text(
                'Cambiar Edad',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                userBloc.add(ChangeUserAge(35));
              }),
          MaterialButton(
              color: Colors.blue,
              child: Text(
                'Añadir Profesion',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                userBloc.add(AddUserProfessions(
                    "Profession ${userBloc.state.user!.profesiones!.length + 1}"));
              }),
        ],
      )),
    );
  }
}
