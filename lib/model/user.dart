class User {
  String? nombre;
  int? edad;
  List<String>? profesiones;

  User({required this.nombre, required this.edad, this.profesiones})
      : assert(nombre != null);
}
