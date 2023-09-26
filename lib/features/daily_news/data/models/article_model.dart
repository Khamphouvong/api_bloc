import 'package:api_bloc/features/daily_news/domain/entities/article_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'article_model.g.dart';

@JsonSerializable()
class ArticlesListModel extends ArticlesListEntity {
  const ArticlesListModel({this.articles}) : super(articlesEntity: articles);

  final List<ArticleModel>? articles;

  factory ArticlesListModel.fromJson(Map<String, dynamic> json) =>
      _$ArticlesListModelFromJson(json);
}

@JsonSerializable()
class ArticleModel extends ArticleEntity {
  const ArticleModel({
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  }) : super(
          authorEntity: author,
          titleEntity: title,
          descriptionEntity: description,
          urlEntity: url,
          urlToImageEntity: urlToImage,
          publishedAtEntity: publishedAt,
          contentEntity: content,
        );

  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? publishedAt;
  final String? content;

  factory ArticleModel.fromJson(Map<String, dynamic> json) =>
      _$ArticleModelFromJson(json);
}
