import 'package:hive/hive.dart';

part 'favori.g.dart';

@HiveType(typeId: 1)
class Favori {
  Favori({this.name, this.idMeal, this.photoUrl});

  @HiveField(0)
  String? name;

  @HiveField(1)
  String? idMeal;

  @HiveField(2)
  String? photoUrl;

  @override
  String toString() {
    return '$name: $idMeal';
  }
}
