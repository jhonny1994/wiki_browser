import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wiki_browser/src/appliication/browser_notifier.dart';

class InitialScreen extends ConsumerWidget {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchTerm = TextEditingController();

    return SizedBox(
      width: 500,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Enter your search term here',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 16),
          TextField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
            controller: searchTerm,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () =>
                ref.read(browserNotifierProvider.notifier).getArticle(
                      searchTerm.text.trim(),
                    ),
            child: const Text('search'),
          ),
        ],
      ),
    );
  }
}
