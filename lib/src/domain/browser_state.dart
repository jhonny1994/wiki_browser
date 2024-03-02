import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wiki_browser/src/domain/article.dart';
part 'browser_state.freezed.dart';

@freezed
class BrowserState with _$BrowserState {
  const factory BrowserState.failure(String error) = Failure;

  const factory BrowserState.loading() = Loading;

  const factory BrowserState.success(Article article) = Success;
  const factory BrowserState.initial() = Initial;
}
