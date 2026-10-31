import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

import '../models/article models.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  final Dio dio = Dio();

  Future<void> getHomeData() async {
    try {
      emit(HomeLoading());

      final Response response = await dio.get(
        'https://newsapi.org/v2/top-headlines',
        queryParameters: {
          'apiKey': 'df874839914d4b64a6fe1f4a957b02ac',
          'country': 'us',
        },
      );

      final articles = response.data['articles'] as List;

      final data = articles.map((e) => ArticleModel.fromJson(e)).toList();

      emit(HomeSuccess(data));
    } on DioException catch (e) {
    } catch (e) {
      emit(HomeFailure(e.toString()));
    }
  }

  Future<void> getSearchData({required String query}) async {
    try {
      emit(HomeLoading());
      final Response response = await dio.get(
        "https://newsapi.org/v2/everything",
        queryParameters: {
          'q': query,
          'apiKey': "6a2bfa8471a048ddab606150547fe945",
        },
      );
      final articles = response.data['articles'] as List;
      final data = articles.map((e) => ArticleModel.fromJson(e)).toList();
      emit(HomeSuccess(data));
    } on DioException catch (E) {
      emit(HomeFailure(E.message ?? 'Dio exception'));
    } catch (e) {
      emit(HomeFailure(e.toString()));
    }
  }
}
