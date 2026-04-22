import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeSlider extends StatelessWidget {
  const HomeSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: CarouselSlider.builder(
          itemCount: imgList.length,
          itemBuilder: (context, index, realIdx) {
            return SizedBox(
              child: Image.network(imgList[index]),
            );
          },
          options: CarouselOptions(
              autoPlay: true, aspectRatio: 2.0, enlargeCenterPage: true)),
    );
  }
}

final List<String> imgList = [
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTrHJlPyjuXjbxfZ4cnRZMwf2qas3Jzv9w8Ag&s",
  "https://safaryti.com/blogs/1741790454EneC3VyAS9",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTY0RK5mFa5l_cRw-quxfo3xOqC7oNCbibw5A&s",
];
