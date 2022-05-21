import 'package:flutter/material.dart';

class PageTwoPage extends StatelessWidget {
  const PageTwoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              onPressed: () {}),
          MaterialButton(
              color: Colors.blue,
              child: Text(
                'Cambiar Edad',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {}),
          MaterialButton(
              color: Colors.blue,
              child: Text(
                'Añadir Profesion',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {}),
        ],
      )),
    );
  }
}
