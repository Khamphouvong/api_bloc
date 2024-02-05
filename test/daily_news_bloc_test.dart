import 'package:api_bloc/features/daily_news/data/models/article_model.dart';
import 'package:api_bloc/features/daily_news/domain/usecases/get_new_artcle_usecase.dart';
import 'package:api_bloc/features/daily_news/presentation/bloc/daily_news_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'util/test_helper.dart';

// Mocking the dependencies
@GenerateMocks([GetNewsArticleUsecase])
import 'daily_news_bloc_test.mocks.dart';

void main() {
  late MockGetNewsArticleUsecase mockGetNewsArticleUsecase;
  late DailyNewsBloc dailyNewsBloc;

  setUp(() {
    mockGetNewsArticleUsecase = MockGetNewsArticleUsecase();
    dailyNewsBloc = DailyNewsBloc(mockGetNewsArticleUsecase);
  });

  tearDown(() {
    dailyNewsBloc.close();
  });

  group('DailyNewsBloc Tests', () {
    blocTest<DailyNewsBloc, DailyNewsState>(
      'emits [DailyNewsLoading, DailyNewsLoaded] when news articles are successfully fetched',
      build: () {
        // Setup the mock usecase to return a successful result
        when(mockGetNewsArticleUsecase(any)).thenAnswer(
          (_) async => const Right(
            ArticlesListModel(
              articles: [
                ArticleModel(
                  author: 'Test Author',
                  content: 'Test Content',
                  description: 'Test Description',
                  publishedAt: 'Test Published At',
                  title: 'Test Title',
                  url: 'Test URL',
                  urlToImage: 'Test URL To Image',
                ),
              ],
            ),
          ),
        );
        return dailyNewsBloc;
      },
      act: (bloc) => bloc.add(
        const GetNewsArticleEvent(),
      ),
      expect: () => [
        const DailyNewsLoading(),
        isA<DailyNewsLoaded>().having(
          (state) => state.listNewsArticle,
          'ArticlesList',
          equals(
            const ArticlesListModel(
              articles: [
                ArticleModel(
                  author: 'Test Author',
                  content: 'Test Content',
                  description: 'Test Description',
                  publishedAt: 'Test Published At',
                  title: 'Test Title',
                  url: 'Test URL',
                  urlToImage: 'Test URL To Image',
                ),
              ],
            ),
          ),
        ),
      ],
    );

    blocTest<DailyNewsBloc, DailyNewsState>(
      'emits [DailyNewsLoading, DailyNewsError] when fetching news articles fails',
      build: () {
        // Setup the mock usecase to return an error
        when(mockGetNewsArticleUsecase(any)).thenAnswer(
          (_) async => const Left(
            FetchDataError(
              'Cannot Fetch Data',
            ),
          ),
        );
        return dailyNewsBloc;
      },
      act: (bloc) => bloc.add(
        const GetNewsArticleEvent(),
      ),
      expect: () => [
        const DailyNewsLoading(),
        isA<DailyNewsError>(),
      ],
    );
  });
}
