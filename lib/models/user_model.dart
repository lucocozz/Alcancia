class User {
  final String id;
  final String email;
  final String firstName;
  final String lastName;

  User({this.email, this.firstName, this.id, this.lastName});

  User.fromData(Map<String, dynamic> data)
      : id = data["id"],
        email = data["email"],
        firstName = data["firstName"],
        lastName = data["lastName"];

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "email": email,
      "firstName": firstName,
      "lastName": lastName,
    };
  }
}
