import 'package:api_bloc/core/errors/failure.dart';
import 'package:api_bloc/features/daily_news/domain/entities/article_entity.dart';
import 'package:dartz/dartz.dart';

abstract class ArticleRepo {
  Future<Either<Failure, ArticlesListEntity>> getNewsArticle(
    String country,
    String category,
    String apiKey,
  );
}
