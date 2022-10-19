import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/movieOverView/bindings/movie_over_view_binding.dart';
import '../modules/movieOverView/views/movie_over_view_view.dart';
import '../modules/moviesList/bindings/movies_list_binding.dart';
import '../modules/moviesList/views/movies_list_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;
  static const MOVIES = Routes.MOVIES_LIST;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.MOVIES_LIST,
      page: () => MoviesListView(),
      binding: MoviesListBinding(),
    ),
    // GetPage(
    //   name: _Paths.MOVIE_OVER_VIEW,
    //   page: () => MovieOverViewView(),
    //   binding: MovieOverViewBinding(),
    // ),
  ];
}
