import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';


class TrendingRestaurants extends StatefulWidget {
  const TrendingRestaurants({super.key});

  @override
  State<TrendingRestaurants> createState() => _TrendingRestaurantsState();
}

class _TrendingRestaurantsState extends State<TrendingRestaurants> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        shrinkWrap: true,
        physics:const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: SizedBox(
               
                child: Image.network("https://i1.wp.com/cdn.whatsuplife.in/hyderabad/listing/0_1489730324.jpg?resize=823,411",fit: BoxFit.cover,),
              ),
            )
          );
        },
      ),
    );
  }
}
