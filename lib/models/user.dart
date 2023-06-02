class User {
  late String userId;
  late String firstName;
  late String lastName;
  late String email;
  late String password;
  late String pseudo;
  int coins = 10;
  late String avatar;
  List<String> field;

  User(
      {required this.userId,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.password,
      required this.pseudo,
      required this.coins,
      required this.avatar,
      required this.field});
}
