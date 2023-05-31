class User {
  String firstName;
  String lastName;
  String email;
  String password;
  String pseudo;
  int coins = 10;
  String avatar;

  User({
    required this.firstName, required this.lastName, required this.email,
    required this.password, required this.pseudo, required this.coins, required this.avatar
  });
}