import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hackaton_2024_mv/core/api/api_manager.dart';
import 'package:hackaton_2024_mv/core/api/api_manager_imp.dart';

final _dioProvider = Provider((ref) => Dio(
      BaseOptions(
        baseUrl: "https://docusenseai-api.gse.com.co",
        connectTimeout: const Duration(seconds: 60 * 2),
        receiveTimeout: const Duration(seconds: 60 * 2),
      ),
    ));

final apiProvider = Provider<ApiManager>(
  (ref) => ApiManagerImp(
    dio: ref.read(_dioProvider),
  ),
);
