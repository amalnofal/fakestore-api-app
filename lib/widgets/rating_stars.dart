import 'package:flutter/material.dart';

class RatingStars extends StatelessWidget {
  final double rate;

  const RatingStars({super.key, required this.rate});

  @override
  Widget build(BuildContext context) {
    List<Widget> stars = [];
    int fullStars = rate.floor();
    bool hasHalfStar = (rate - fullStars) >= 0.5;

    for (int i = 0; i < 5; i++) {
      if (i < fullStars) {
        stars.add(const Icon(Icons.star, color: Colors.amber, size: 20));
      } else if (i == fullStars && hasHalfStar) {
        stars.add(const Icon(Icons.star_half, color: Colors.amber, size: 20));
      } else {
        stars.add(const Icon(Icons.star_border, color: Colors.amber, size: 20));
      }
    }

    return Row(children: stars);
  }
}