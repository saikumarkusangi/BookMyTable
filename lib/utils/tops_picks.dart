import 'dart:ui';

import 'package:dinner_is_done/common/shimmer_loading.dart';
import 'package:dinner_is_done/controllers/data_controller.dart';
import 'package:dinner_is_done/models/top_picks_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../views/details_page.dart';

class TopPicks extends ConsumerWidget {
  const TopPicks({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(topPicksProvider);

  return  data.when(
      error: (error, s) => Center(
        child: Text(error.toString()),
      ),
      loading: () => const ShimmerLoading(),
      data: (data) {
        List<TopPicksModel> results = data.map((e) => e).toList();
        return GridView.builder(
          itemCount: results.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            // childAspectRatio: widget.childAxisRatio,
          ),
          itemBuilder: (context, index) {
            return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: ()=> Navigator.push(context,MaterialPageRoute(builder: (_)=> DetailsPage(
                            
                             name: results[index].name,
                              menu: results[index].menu,
                              mobile: results[index].phoneNumber,
                              rating: results[index].rating.toString(),
                              description:results[index].description,
                              image: results[index].image,))),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Card(
                        elevation: 40,
                        child: Container(
                          decoration:  BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                    results[index].logo
                                      ))),
                        ),
                      )),
                ));
          },
        );
      },
    );
  }
}
