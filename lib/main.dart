import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:task/app/modules/moviesList/views/movies_list_view.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatefulWidget {
  const Myapp({Key? key});

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Application",
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.MOVIES,
      getPages: AppPages.routes,
      // home: MoviesListView(),
    );
  }
}
