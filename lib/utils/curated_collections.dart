import 'dart:ui';
import 'package:dinner_is_done/common/shimmer_loading.dart';
import 'package:dinner_is_done/models/collections_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controllers/data_controller.dart';
import '../views/views.dart';

class CuratedCollections extends ConsumerWidget {
  final int crossAxisCount;
  final double childAxisRatio;
  const CuratedCollections(
      {super.key, required this.crossAxisCount, required this.childAxisRatio});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _data = ref.watch(collectionsProvider);

   return  _data.when(
      error: (err,s) => Center(child: Text(err.toString()),),
      loading: ()=>Center(child: const ShimmerLoading()),
      data: (_data) {
        List<CollectionsModel> collections = _data.map((e) => e).toList();

        return GridView.builder(
          itemCount: collections.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            childAspectRatio: childAxisRatio,
          ),
          itemBuilder: (context, index) {
            return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () => Navigator.push(context,MaterialPageRoute(builder: (_)=> PreviewPage(
                    image: collections[index].image,
                    title:collections[index].name,
                    description: collections[index].description,
                    ))),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            decoration:  BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                      collections[index].image
                                       ))),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.4)),
                              ),
                            ),
                          )),
                       Text(
                        collections[index].name,
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 22),
                            textAlign: TextAlign.center,
                      ),
                       Positioned(
                        bottom: 20,
                         child: Text(
                         (crossAxisCount == 1) ? collections[index].description : "",
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18),
                              textAlign: TextAlign.center,
                                             ),
                       )
                    ],
                  ),
                ));
          },
        );
      },
    );
  }
}
