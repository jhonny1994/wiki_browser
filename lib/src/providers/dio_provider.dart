import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wiki_browser/consts.dart';
part 'dio_provider.g.dart';

@riverpod
Dio dioService(DioServiceRef ref) {
  return Dio(BaseOptions(baseUrl: baseUrl));
}
