import 'package:injectable/injectable.dart';

import '../../data/model/favorite_fact/favorite_fact_model.dart';
import '../../data/repository/favorites_repository.dart';

import '../base/base_cubit.dart';
import '../base/base_state.dart';

part 'favorites_page_state.dart';

@injectable
class FavoritesPageCubit extends BaseCubit<FavoritesPageState> {
  final LocalRepository localRepository;
  FavoritesPageCubit(this.localRepository) : super(const FavoritesPageState());

  Future<void> init() async {
    emit(state.copyWith(
      favoriteFacts: await localRepository.getFacts(),
      status: PageStatus.loaded,
    ));
  }

  @override
  void handleError(Exception exception) {
    emit(state.copyWith(error: exception));
  }
}
