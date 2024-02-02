import 'package:flutter/material.dart';

Widget buildCarouselImage(String imagePath) {
  return ClipRRect(
    borderRadius: const BorderRadius.only(
      topLeft: const Radius.circular(1),
      topRight: const Radius.circular(1),
      bottomLeft: const Radius.circular(15),
      bottomRight: const Radius.circular(15),
    ),
    child: Image.asset(
      imagePath,
      fit: BoxFit.cover,
      width: double.infinity,
    ),
  );
}


          