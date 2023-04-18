class UsersModel {
  String? id;
  String email;
  String username;

  UsersModel({required this.email, required this.username, this.id});

  factory UsersModel.fromJson(Map<String, dynamic> map) {
    return UsersModel(
        email: map['email'], username: map['username'], id: map['id']);
  }
}
