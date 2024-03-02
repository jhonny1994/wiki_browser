import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wiki_browser/src/appliication/browser_notifier.dart';
import 'package:wiki_browser/src/presentation/article_screen.dart';
import 'package:wiki_browser/src/presentation/initial_screen.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final browser = ref.watch(browserNotifierProvider);
    return Scaffold(
      appBar: browser.whenOrNull(
        success: (article) => AppBar(
          centerTitle: true,
          title: Text(article.title),
          actions: [
            IconButton(
              onPressed: () =>
                  ref.read(browserNotifierProvider.notifier).clearArticle(),
              icon: const Icon(Icons.clear),
            ),
          ],
        ),
        failure: (article) => AppBar(
          actions: [
            IconButton(
              onPressed: () =>
                  ref.read(browserNotifierProvider.notifier).clearArticle(),
              icon: const Icon(Icons.clear),
            ),
          ],
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: browser.when(
            failure: (error) => Text(error),
            loading: () => const CircularProgressIndicator(),
            success: (article) => ArticleScreen(article),
            initial: () => const InitialScreen(),
          ),
        ),
      ),
    );
  }
}
