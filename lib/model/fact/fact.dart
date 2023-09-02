import 'package:json_annotation/json_annotation.dart';

part 'fact.g.dart';

@JsonSerializable()
class Fact {
  @JsonKey(name: 'text')
  final String text;
  @JsonKey(name: 'createdAt')
  final DateTime createdAt;

  Fact(
    this.text,
    this.createdAt,
  );

  factory Fact.fromJson(Map<String, dynamic> json) {
    return _$FactFromJson(json);
  }
}
