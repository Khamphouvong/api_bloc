import 'package:api_bloc/features/daily_news/domain/entities/article_entity.dart';
import 'package:flutter/material.dart';

class NewsDescWidget extends StatelessWidget {
  final ArticleEntity articleModel;
  const NewsDescWidget({super.key, required this.articleModel});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 7),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Expanded(
              child: Text(
                articleModel.titleEntity ?? '',
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontFamily: 'Butler',
                  fontWeight: FontWeight.w900,
                  fontSize: 18,
                  color: Colors.black87,
                ),
              ),
            ),

            // Description
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  articleModel.descriptionEntity ?? '',
                  maxLines: 2,
                ),
              ),
            ),

            // Datetime
            Row(
              children: [
                const Icon(Icons.timeline_outlined, size: 16),
                const SizedBox(width: 4),
                Text(
                  articleModel.publishedAtEntity ?? '',
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
