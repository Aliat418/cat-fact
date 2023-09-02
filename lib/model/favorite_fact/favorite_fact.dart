import 'package:hive/hive.dart';

part 'favorite_fact.g.dart';

@HiveType(typeId: 0)
class FavoriteFact extends HiveObject {
  @HiveField(0)
  final String text;

  @HiveField(1)
  final String createdAt;

  FavoriteFact({
    required this.text,
    required this.createdAt,
  });
}
