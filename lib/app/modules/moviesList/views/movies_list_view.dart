import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:get/get.dart';
import 'package:task/app/modules/movieOverView/views/movie_over_view_view.dart';

import '../../home/controllers/home_controller.dart';
import '../controllers/movies_list_controller.dart';

var globalFontFamily = 'Poppins';
var imageBasePath = 'https://image.tmdb.org/t/p/original/';

class MoviesListView extends GetView<MoviesListController> {
  final moviesListController = Get.put(MoviesListController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('MoviesListView'),
          centerTitle: true,
        ),
        body: Obx(() => ListView.builder(
            controller: moviesListController.scrollController,
            itemCount: moviesListController.moviesList.length,
            itemBuilder: (BuildContext context, int index) {
              var details = moviesListController.moviesList[index];
              return GestureDetector(
                onTap: () {
                  Get.to(MovieOverViewView(details));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(
                    children: [
                      Container(
                        height: 200,
                        width: double.infinity,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: CachedNetworkImage(
                            fit: BoxFit.fill,
                            imageUrl: imageBasePath + details['backdrop_path'],
                            placeholder: (context, url) => Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        MediaQuery.of(context).size.width * 0.4,
                                    vertical:
                                        MediaQuery.of(context).size.width *
                                            0.18),
                                child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 8,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Text(
                            details['original_title'],
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontFamily: globalFontFamily),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            })));
  }
}
