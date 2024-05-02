class Users {
  String? id;
  String? name;
  String? email;
  String? avatar;


  Users({this.id, this.name, this.email, this.avatar});

  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      avatar: json['avatar'],
    );
  }
}