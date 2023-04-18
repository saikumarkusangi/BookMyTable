import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class TrendingRestaurants extends StatefulWidget {
  final Axis scrollDirection;
  const TrendingRestaurants({super.key,required this.scrollDirection});

  @override
  State<TrendingRestaurants> createState() => _TrendingRestaurantsState();
}

class _TrendingRestaurantsState extends State<TrendingRestaurants> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: widget.scrollDirection,
        itemCount: 4,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Image.network(
                    "https://i1.wp.com/cdn.whatsuplife.in/hyderabad/listing/0_1489730324.jpg?resize=823,411",
                    fit: BoxFit.cover,
                  ),
                ),
              ));
        },
      ),
    );
  }
}
