import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../commons/styles.dart';

class CustomCarousel extends StatelessWidget {
  final List<String> imgList;
  final List<String> imgNameList;

  const CustomCarousel({
    Key? key,
    required this.imgList,
    required this.imgNameList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Widget> imageSliders = imgList
        .map(
          (item) => Container(
            margin: const EdgeInsets.all(5),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              child: Stack(
                children: <Widget>[
                  Image.network(
                    fit: BoxFit.cover,
                    item,
                    height: 600,
                    width: 400,
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [ThemeColors.red, Color.fromARGB(0, 0, 0, 0)],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 20,
                      ),
                      child: Text(
                        imgNameList[imgList.indexOf(item)],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
        .toList();

    return CarouselSlider(
      options: CarouselOptions(
        height: 400,
        aspectRatio: 3,
        enlargeCenterPage: true,
      ),
      items: imageSliders,
    );
  }
}
