import 'package:api_bloc/config/constants/api_constant.dart';
import 'package:api_bloc/features/daily_news/data/models/article_model.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
part 'daily_news_api.g.dart';

@lazySingleton
@RestApi(baseUrl: baseUrlApiNews)
abstract class DailyNewsApi {
  @factoryMethod
  factory DailyNewsApi(Dio dio) = _DailyNewsApi;

  @GET(topHeadlines)
  Future<ArticlesListModel> getNewsArticle({
    @Query('country') String? country,
    @Query('category') String? category,
    @Query('apiKey') String? apiKey,
  });
}
