part of 'daily_news_bloc.dart';

sealed class DailyNewsState extends Equatable {
  const DailyNewsState();

  @override
  List<Object> get props => [];
}

class DailyNewsLoading extends DailyNewsState {
  const DailyNewsLoading();
}

class DailyNewsLoaded extends DailyNewsState {
  final ArticlesListEntity? listNewsArticle;
  const DailyNewsLoaded(this.listNewsArticle);
}

class DailyNewsError extends DailyNewsState {
  final String? error;
  const DailyNewsError(this.error);
}
