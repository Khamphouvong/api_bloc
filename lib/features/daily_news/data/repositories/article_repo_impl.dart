import 'dart:io';

import 'package:api_bloc/core/errors/exceptions.dart';
import 'package:api_bloc/core/errors/failure.dart';
import 'package:api_bloc/features/daily_news/data/datasource/daily_news_remote_datasource.dart';
import 'package:api_bloc/features/daily_news/data/models/article_model.dart';
import 'package:api_bloc/features/daily_news/domain/repositories/article_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ArticleRepo)
class ArticleRepoImpl implements ArticleRepo {
  final DailyNewsRemoteDataSource _dailyNewsRemoteDataSource;

  ArticleRepoImpl(this._dailyNewsRemoteDataSource);

  @override
  Future<Either<Failure, ArticlesListModel>> getNewsArticle(
      String country, String category, String apiKey) async {
    try {
      final httpResponse = await _dailyNewsRemoteDataSource.getNewsArticle(
        country: country,
        category: category,
        apiKey: apiKey,
      );
      return Right(httpResponse);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message.toString()));
    } on SocketException catch (e) {
      return Left(ServerFailure(e.message.toString()));
    } on ConnectionException catch (e) {
      return Left(ConnectionFailure(e.message.toString()));
    }
  }
}
