// class User {
//   int? id;
//   String? name;
//   String? phone;
//   //String? image;
//   String? email;
//   String? token;
//
//   User({
//     this.id,
//     this.name,
//     this.phone,
//     this.email,
//     this.token
//   });
//
//
//   // function to convert json data to user model
//   factory User.fromJson(Map<String, dynamic> json){
//     return User(
//         id: json['user']['id'],
//         name: json['user']['name'],
//         phone: json['user']['phone'],
//         email: json['user']['email'],
//         token: json['token']
//     );
//   }
// }

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    required this.token,
    required this.user,
  });

  String token;
  UserClass user;

  factory User.fromJson(Map<String, dynamic> json) => User(
    token: json["token"],
    user: UserClass.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "user": user.toJson(),
  };
}

class UserClass {
  UserClass({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
  });

  int id;
  String name;
  String phone;
  String email;

  factory UserClass.fromJson(Map<String, dynamic> json) => UserClass(
    id: json["id"],
    name: json["name"],
    phone: json["phone"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "phone": phone,
    "email": email,
  };
}

