import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:wiki_browser/src/domain/article.dart';

class ArticleScreen extends ConsumerWidget {
  const ArticleScreen(this.article, {super.key});
  final Article article;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(article.extract),
        const SizedBox(height: 16),
        if (article.thumbnail != null)
          Expanded(
            child: CachedNetworkImage(
              imageUrl: article.thumbnail!,
              fit: BoxFit.contain,
            ),
          ),
        const SizedBox(height: 16),
        TextButton(
          onPressed: () => launchUrlString(article.url),
          child: const Text('source'),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
