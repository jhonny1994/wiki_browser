import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wiki_browser/consts.dart';
import 'package:wiki_browser/src/domain/article.dart';
import 'package:wiki_browser/src/domain/browser_state.dart';
import 'package:wiki_browser/src/providers/dio_provider.dart';
part 'browser_notifier.g.dart';

@riverpod
class BrowserNotifier extends _$BrowserNotifier {
  @override
  BrowserState build() {
    return const BrowserState.initial();
  }

  Future<void> getArticle(String searchTerm) async {
    state = const BrowserState.loading();
    try {
      final dio = ref.read(dioServiceProvider);
      final response = await dio.get<Map<String, dynamic>>(path + searchTerm);
      switch (response.statusCode) {
        case 200:
          final article = Article.fromJson(response.data!);
          state = BrowserState.success(article);
        case 404:
          state = const BrowserState.failure(
            'The term you searched for is not found, please try again with a different word.',
          );
        default:
          state = const BrowserState.failure(
            'There was a problem, please try again.',
          );
      }
    } on DioException catch (e) {
      state = BrowserState.failure(
        e.response!.statusCode == 404
            ? 'The term you searched for is not found, please try again with a different word.'
            : e.message!,
      );
    }
  }

  void clearArticle() {
    state = const BrowserState.initial();
  }
}
