import 'package:dinner_is_done/themes/themes.dart';
import 'package:dinner_is_done/utils/curated_collections.dart';
import 'package:dinner_is_done/utils/trending_restaurants.dart';
import 'package:flutter/material.dart';


class TrendingRestaurantPage extends StatefulWidget {
  const TrendingRestaurantPage({super.key});

  @override
  State<TrendingRestaurantPage> createState() => _TrendingRestaurantPageState();
}

class _TrendingRestaurantPageState extends State<TrendingRestaurantPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Themes.backgroundColor,
        centerTitle: true,
        title: const Text("Trending Restaurants",style: TextStyle(
          color: Colors.black
        ),),
      ),
      body:  SingleChildScrollView(
        physics:const BouncingScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(height: 20),
             TrendingRestaurants(scrollDirection:Axis.vertical),
             
          ],
        ),
      ));
  }
}