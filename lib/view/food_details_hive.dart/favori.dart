import 'package:hive/hive.dart';

part 'favori.g.dart';

@HiveType(typeId: 1)
class Favori {
  Favori({required this.name, required this.age, required this.friends});

  @HiveField(0)
  String name;

  @HiveField(1)
  int age;

  @HiveField(2)
  List<String> friends;

  @override
  String toString() {
    return '$name: $age';
  }
}
