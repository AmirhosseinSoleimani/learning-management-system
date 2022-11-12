import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingStar extends StatefulWidget {
  const RatingStar({Key? key}) : super(key: key);

  @override
  State<RatingStar> createState() => _RatingStarState();
}

class _RatingStarState extends State<RatingStar> {
  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
        minRating: 1,
        itemSize: 25,
        itemBuilder: (context, _) => const Icon(
          Icons.star,
          color: Colors.amber,
        ),
        onRatingUpdate: (rating) => setState(() {
          rating = rating;
        }));
  }
}
