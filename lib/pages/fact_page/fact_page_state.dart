part of 'fact_page_cubit.dart';

class FactPageState extends BaseState {
  final Fact? fact;
  final String? formattedDate;
  final String? imageCurrentUrl;

  const FactPageState({
    this.fact,
    this.formattedDate,
    this.imageCurrentUrl,
    super.status,
    super.error,
  });

  @override
  FactPageState copyWith({
    PageStatus? status,
    Exception? error,
    Fact? fact,
    String? formattedDate,
    String? imageCurrentUrl,
  }) {
    return FactPageState(
      status: status ?? this.status,
      error: error,
      fact: fact ?? this.fact,
      formattedDate: formattedDate ?? this.formattedDate,
      imageCurrentUrl: imageCurrentUrl ?? imageCurrentUrl,
    );
  }

  @override
  List<Object?> get props {
    return [
      status,
      error,
      fact,
      formattedDate,
      imageCurrentUrl,
    ];
  }
}
