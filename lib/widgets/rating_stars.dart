import 'package:flutter/material.dart';

class RatingStars extends StatelessWidget {
  final int rating;

  RatingStars(this.rating); // Constructor with parameter

  // Named constructor
  RatingStars.custom({Key? key}) : rating = 0, super(key: key);

  @override
  Widget build(BuildContext context) {
    String stars = '';
    for (int i = 0 ; i< rating; i++ ){
      stars +='⭐️';
    }
    stars.trim();
    return Text(stars,style: TextStyle(fontSize: 18.0),);
  }
}
