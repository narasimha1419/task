import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../moviesList/views/movies_list_view.dart';
import '../controllers/movie_over_view_controller.dart';

class MovieOverViewView extends GetView<MovieOverViewController> {
  MovieOverViewView(
    this.overViewdetails, {
    Key? key,
  });

  final overViewdetails;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MovieOverViewView'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 200,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  fit: BoxFit.fill,
                  imageUrl: imageBasePath + overViewdetails['backdrop_path'],
                  placeholder: (context, url) => Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.4,
                          vertical: MediaQuery.of(context).size.width * 0.18),
                      child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'overview',
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  fontFamily: globalFontFamily),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                overViewdetails['overview'],
                style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey,
                    fontWeight: FontWeight.w400,
                    fontFamily: globalFontFamily),
              ),
            )
          ],
        ),
      ),
    );
  }
}
