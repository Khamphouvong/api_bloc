import 'package:equatable/equatable.dart';

class ArticlesListEntity extends Equatable {
  final List<ArticleEntity>? articlesEntity;

  const ArticlesListEntity({
    this.articlesEntity,
  });

  @override
  List<Object?> get props => [articlesEntity];
}

class ArticleEntity extends Equatable {
  final String? authorEntity;
  final String? titleEntity;
  final String? descriptionEntity;
  final String? urlEntity;
  final String? urlToImageEntity;
  final String? publishedAtEntity;
  final String? contentEntity;

  const ArticleEntity({
    this.authorEntity,
    this.titleEntity,
    this.descriptionEntity,
    this.urlEntity,
    this.urlToImageEntity,
    this.publishedAtEntity,
    this.contentEntity,
  });

  @override
  List<Object?> get props => [
        authorEntity,
        titleEntity,
        descriptionEntity,
        urlEntity,
        urlToImageEntity,
        publishedAtEntity,
        contentEntity,
      ];
}
