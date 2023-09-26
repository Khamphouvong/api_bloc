import 'package:equatable/equatable.dart';

abstract class Usecase<Type, Params> {
  Future<Type> call(Params params);
}

class GetNewsArticle extends Equatable {
  final String country;
  final String category;
  final String apiKey;

  const GetNewsArticle({
    required this.country,
    required this.category,
    required this.apiKey,
  });

  @override
  List<Object> get props => [country, category, apiKey];
}
