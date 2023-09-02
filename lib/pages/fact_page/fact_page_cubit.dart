import 'package:injectable/injectable.dart';

import '../../data/repository/favorites_repository.dart';
import '../../data/model/fact/fact_model.dart';
import '../../data/repository/facts_repository.dart';
import '../../infrastructure/constants.dart';
import '../../utils/url_time_stamp.dart';

import '../base/base_cubit.dart';
import '../base/base_state.dart';

part 'fact_page_state.dart';

@injectable
class FactPageCubit extends BaseCubit<FactPageState> {
  final RemoteFactsRepository remoteRepository;
  final LocalRepository localRepository;

  FactPageCubit(
    this.remoteRepository,
    this.localRepository,
  ) : super(const FactPageState());

  Future<void> init() async {
    emit(state.copyWith(status: PageStatus.loaded));
  }

  Future<void> fetchNewFact() async {
    await perform(() async {
      final facts = await remoteRepository.getFacts();
      emit(state.copyWith(
        fact: facts.first,
        formattedDate: await remoteRepository.fetchFactDate(facts.first),
        imageCurrentUrl: addTimestampToUrl(kCatsBaseUrl),
      ));
    });
  }

  Future<void> addToFavorites() async {
    await perform(() async {
      final fact = state.fact;
      final formattedDate = state.formattedDate;
      if (fact == null || formattedDate == null) {
        return;
      }
      final saved = await localRepository.saveFact(
        text: fact.text,
        createdAt: formattedDate,
      );
      if (saved) {
        emit(state.copyWith(imageCurrentUrl: state.imageCurrentUrl));
      }
    });
  }

  @override
  void handleError(Exception exception) {
    emit(state.copyWith(error: exception));
  }
}
