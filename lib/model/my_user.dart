class MyUser {
  static const String coloectionName = "user";
  String? id, name, email;
  MyUser({required this.id, required this.name, required this.email});
  //json=> orm
   MyUser.fromFireStor(Map<String, dynamic> data)
      : this(
          id: data['id'],
          name: data['name'],
          email: data['email'],
        );
  //orm=>json
  Map<String, dynamic> toFirestore() {
    return {'id': id, 'name': name, 'email': email};
  }
}
