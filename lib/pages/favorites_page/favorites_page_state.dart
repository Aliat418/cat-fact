part of 'favorites_page_cubit.dart';

class FavoritesPageState extends BaseState {
  final List<FavoriteFactModel> favoriteFacts;

  const FavoritesPageState({
    this.favoriteFacts = const [],
    super.status,
    super.error,
  });

  @override
  FavoritesPageState copyWith({
    PageStatus? status,
    Exception? error,
    List<FavoriteFactModel>? favoriteFacts,
  }) {
    return FavoritesPageState(
      status: status ?? this.status,
      error: error,
      favoriteFacts: favoriteFacts ?? this.favoriteFacts,
    );
  }

  @override
  List<Object?> get props {
    return [
      status,
      error,
      favoriteFacts,
    ];
  }
}
