part of 'daily_news_bloc.dart';

sealed class DailyNewsEvent extends Equatable {
  const DailyNewsEvent();

  @override
  List<Object> get props => [];
}

final class GetNewsArticleEvent extends DailyNewsEvent {
  const GetNewsArticleEvent();
}
