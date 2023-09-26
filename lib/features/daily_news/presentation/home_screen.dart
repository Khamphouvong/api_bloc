import 'package:api_bloc/features/daily_news/presentation/widgets/image_widget.dart';
import 'package:api_bloc/features/daily_news/presentation/widgets/news_desc_widget.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../config/DI/dependencies_config.dart';
import 'bloc/daily_news_bloc.dart';

@RoutePage()
class HomeScreen extends StatelessWidget implements AutoRouteWrapper {
  const HomeScreen({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<DailyNewsBloc>()..add(const GetNewsArticleEvent()),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Daily News"),
      ),
      body: BlocBuilder<DailyNewsBloc, DailyNewsState>(
        builder: (context, state) {
          if (state is DailyNewsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is DailyNewsLoaded) {
            return ListView.builder(
              itemCount: state.listNewsArticle!.articlesEntity!.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsetsDirectional.only(
                      start: 14, end: 14, bottom: 8, top: 8),
                  height: MediaQuery.of(context).size.width / 2.2,
                  child: Row(
                    children: [
                      ImageWidget(
                          imageUrl: state.listNewsArticle
                                  ?.articlesEntity?[index].urlToImageEntity ??
                              ''),
                      NewsDescWidget(
                        articleModel:
                            state.listNewsArticle!.articlesEntity![index],
                      )
                    ],
                  ),
                );
              },
            );
          } else if (state is DailyNewsError) {
            return Center(
              child: Text(state.error!),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
