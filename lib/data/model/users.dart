class User {
  final String firstName;
  final String lastName;

  User({
    required this.firstName,
    required this.lastName,
  });

  factory User.fromJson(Map<String, dynamic> jsonUser) {
    return User(
      firstName: jsonUser["firstName"],
      lastName: jsonUser["lastName"],
    );
  }
}
