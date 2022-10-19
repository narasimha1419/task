import 'package:get/get.dart';

import '../controllers/movie_over_view_controller.dart';

class MovieOverViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MovieOverViewController>(
      () => MovieOverViewController(),
    );
  }
}
