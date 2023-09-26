import 'package:api_bloc/core/errors/exceptions.dart';
import 'package:api_bloc/core/services/daily_news_api.dart';
import 'package:api_bloc/core/util/response_helper.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../models/article_model.dart';

abstract class DailyNewsRemoteDataSource {
  Future<ArticlesListModel> getNewsArticle(
      {String? country, String? category, String? apiKey});
}

@LazySingleton(as: DailyNewsRemoteDataSource)
class DailyNewsRemoteDataSourceImpl extends DailyNewsRemoteDataSource {
  final DailyNewsApi dailyNewsApi;

  DailyNewsRemoteDataSourceImpl(this.dailyNewsApi);

  @override
  Future<ArticlesListModel> getNewsArticle(
      {String? country, String? category, String? apiKey}) async {
    try {
      return await dailyNewsApi.getNewsArticle(
        country: country,
        category: category,
        apiKey: apiKey,
      );
    } on DioException catch (e) {
      throw ResponseHelper.returnResponse(e);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
