import 'package:api_bloc/core/usecase/usecase.dart';
import 'package:api_bloc/features/daily_news/domain/entities/article_entity.dart';
import 'package:api_bloc/features/daily_news/domain/usecases/get_new_artcle_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'daily_news_event.dart';
part 'daily_news_state.dart';

@injectable
class DailyNewsBloc extends Bloc<DailyNewsEvent, DailyNewsState> {
  final GetNewsArticleUsecase _getNewsArticleUsecase;
  DailyNewsBloc(this._getNewsArticleUsecase) : super(const DailyNewsLoading()) {
    on<DailyNewsEvent>(onGetNewsArticle);
  }
  Future<void> onGetNewsArticle(
      DailyNewsEvent event, Emitter<DailyNewsState> emit) async {
    final dataState = await _getNewsArticleUsecase(
      const GetNewsArticle(
          country: 'us',
          category: 'business',
          apiKey: 'bdf2f746bb904107be9d6cdfa91a6829'),
    );
    emit(const DailyNewsLoading());
    dataState.fold(
      (error) {
        emit(DailyNewsError(error.message));
      },
      (dailyNews) => emit(DailyNewsLoaded(dailyNews)),
    );
  }
}
