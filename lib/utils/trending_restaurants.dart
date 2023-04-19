import 'package:dinner_is_done/common/custom_card.dart';
import 'package:dinner_is_done/common/shimmer_loading.dart';
import 'package:dinner_is_done/controllers/data_controller.dart';
import 'package:dinner_is_done/models/trending_model.dart';
import 'package:dinner_is_done/views/home_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../common/list_tile.dart';
import '../views/details_page.dart';

class TrendingRestaurants extends ConsumerWidget {
  final Axis scrollDirection;
  const TrendingRestaurants({super.key, required this.scrollDirection});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(trendingProvider);

    return data.when(
        error: (error, s) => Center(
              child: Text(error.toString()),
            ),
        loading: () => ShimmerLoading(),
        data: (data) {
          List<TrendingModel> results = data.map((e) => e).toList();

          return (scrollDirection == Axis.horizontal) ?
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                height: 320,
                child: Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                    ),
                    scrollDirection: scrollDirection,
                    itemCount: results.length,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 0.0, vertical: 10),
                          child: InkWell(
                            onTap: ()=> Navigator.push(context,MaterialPageRoute(builder: (_)=>
                            DetailsPage(
                              name: results[index].name,
                              menu: results[index].menu,
                              mobile: results[index].phoneNumber,
                              rating: results[index].rating.toString(),
                              description:results[index].description,
                              image: results[index].image,))),
                            child: CustomCard(
                                description: results[index].description,
                                image: results[index].image,
                                rating: results[index].rating.toString(),
                                name: results[index].name),
                          ));
                    },
                  ),
                ),
              ),
            
            ],
          ) :
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                child: Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                    ),
                    scrollDirection: scrollDirection,
                    itemCount: results.length,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 0.0, vertical: 10),
                          child: InkWell(
                           onTap: ()=> Navigator.push(context,MaterialPageRoute(builder: (_)=> DetailsPage(
                            
                             name: results[index].name,
                              menu: results[index].menu,
                              mobile: results[index].phoneNumber,
                              rating: results[index].rating.toString(),
                              description:results[index].description,
                              image: results[index].image,))),
                            child: CustomCard(
                                description: results[index].description,
                                image: results[index].image,
                                rating: results[index].rating.toString(),
                                name: results[index].name),
                          ));
                    },
                  ),
                ),
              ),
            
            ],
          );
        });
  }
}
