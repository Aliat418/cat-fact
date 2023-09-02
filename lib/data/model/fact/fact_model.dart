import 'package:json_annotation/json_annotation.dart';

part 'fact_model.g.dart';

@JsonSerializable()
class FactModel {
  @JsonKey(name: 'text')
  final String text;
  @JsonKey(name: 'createdAt')
  final DateTime createdAt;

  FactModel(
    this.text,
    this.createdAt,
  );

  factory FactModel.fromJson(Map<String, dynamic> json) {
    return _$FactModelFromJson(json);
  }
}
