import 'dart:ui';

import 'package:dinner_is_done/controllers/data_controller.dart';
import 'package:dinner_is_done/models/restuarants_models.dart';
import 'package:dinner_is_done/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../common/custom_card.dart';
import 'details_page.dart';

class PreviewPage extends ConsumerWidget {
  final String image;
  final String title;
  final String description;

  const PreviewPage(
      {super.key,
      required this.image,
      required this.title,
      required this.description});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(restaurantsProvider);

    return SafeArea(
      child: Scaffold(
          body: data.when(
        error: (err, s) => Center(
          child: Text(err.toString()),
        ),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        data: (data) {
          List<RestaurantsModel> restaurents = [];
          data.map((e) {
            if (e.collection == title) {
              restaurents.add(e);
            }
          }).toList();
          return CustomScrollView(
            slivers: [
              // app bar

              SliverAppBar.large(
                toolbarHeight: 100,
                collapsedHeight: 110,
                flexibleSpace: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(image), fit: BoxFit.cover),
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
                    child: Container(
                      decoration:
                          BoxDecoration(color: Colors.black.withOpacity(0.4)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            title,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 32,
                                color: Themes.primarytextColor),
                            textAlign: TextAlign.center,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              description,
                              style: const TextStyle(
                                  fontSize: 20, color: Themes.primarytextColor),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                title: Text(description),
                expandedHeight: 200,
                automaticallyImplyLeading: false,
                leading: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: InkWell(
                    onTap: () => Navigator.pop(context),
                    child: const CircleAvatar(
                      backgroundColor: Themes.primarytextColor,
                      child: Icon(
                        Icons.arrow_back,
                        color: Themes.secondtextColor,
                      ),
                    ),
                  ),
                ),
              ),

              //  restaurents
              const SliverPadding(padding: EdgeInsets.symmetric(vertical: 10)),
              SliverGrid.builder(
                  itemCount: restaurents.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 30,
                      crossAxisCount: 1,
                      childAspectRatio: 1.2),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => DetailsPage(
                                    name: restaurents[index].name,
                                    menu: restaurents[index].menu,
                                    mobile: restaurents[index].phoneNumber,
                                    rating:
                                        restaurents[index].rating.toString(),
                                    description: restaurents[index].description,
                                    image: restaurents[index].image,
                                  ))),
                      child: CustomCard(
                        name: restaurents[index].name,
                        description: restaurents[index].description,
                        image: restaurents[index].image,
                        rating: restaurents[index].rating.toString(),
                      ),
                    );
                  })
            ],
          );
        },
      )),
    );
  }
}
