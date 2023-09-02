import 'package:hive/hive.dart';

part 'favorite_fact_model.g.dart';

@HiveType(typeId: 0)
class FavoriteFactModel extends HiveObject {
  @HiveField(0)
  final String text;

  @HiveField(1)
  final String createdAt;

  FavoriteFactModel({
    required this.text,
    required this.createdAt,
  });
}
