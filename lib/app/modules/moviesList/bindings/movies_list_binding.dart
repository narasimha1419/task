import 'package:get/get.dart';

import '../controllers/movies_list_controller.dart';

class MoviesListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MoviesListController>(
      () => MoviesListController(),
    );
  }
}
