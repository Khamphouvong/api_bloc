import 'package:api_bloc/core/errors/failure.dart';

import 'package:api_bloc/core/usecase/usecase.dart';
import 'package:api_bloc/features/daily_news/domain/entities/article_entity.dart';
import 'package:api_bloc/features/daily_news/domain/repositories/article_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetNewsArticleUsecase
    implements Usecase<Either<Failure, ArticlesListEntity>, GetNewsArticle> {
  final ArticleRepo _articleRepo;

  GetNewsArticleUsecase(this._articleRepo);
  @override
  Future<Either<Failure, ArticlesListEntity>> call(
      GetNewsArticle getNewsArticleParams) {
    return _articleRepo.getNewsArticle(getNewsArticleParams.country,
        getNewsArticleParams.category, getNewsArticleParams.apiKey);
  }
}
