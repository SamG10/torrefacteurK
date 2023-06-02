import 'dart:ffi';

class Kafe {
  String id;
  String nom;
  String avatar;
  Float taste;
  Float bitterness;
  Float content;
  Float smell;
  double harvestTime;

  Kafe(
      {required this.id,
      required this.nom,
      required this.avatar,
      required this.taste,
      required this.bitterness,
      required this.content,
      required this.smell,
      required this.harvestTime});
}
