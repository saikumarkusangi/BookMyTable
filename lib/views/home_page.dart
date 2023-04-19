import 'package:dinner_is_done/common/list_tile.dart';
import 'package:dinner_is_done/common/shimmer_loading.dart';
import 'package:flutter/material.dart';
import '../themes/themes.dart';
import '../utils/utils.dart';
import 'views.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Themes.backgroundColor,
          leadingWidth: MediaQuery.of(context).size.width / 2,
          leading: Row(children: [
            const SizedBox(
              width: 10,
            ),
            const Icon(
              Icons.location_pin,
              color: Themes.accentColor,
              size: 24,
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                child: const Text(
                  "Hyderabad",
                  style: TextStyle(
                      fontSize: 20,
                      color: Themes.lightBlack,
                      overflow: TextOverflow.ellipsis),
                  maxLines: 1,
                ),
              ),
            )
          ]),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: Icon(
                Icons.person_rounded,
                size: 28,
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
            //padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Expanded(
          child: Column(
            
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // banner
              Image.asset("assets/images/bg.png"),

              //  Curated Collections

              CommonListTile(
                  label: "Curated Collections",
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const CuratedCollectionsPage()))),
              const CuratedCollections(
                crossAxisCount: 2,
                childAxisRatio: 1.5,
              ),

              // Trending Restaurants

              CommonListTile(
                  label: "Trending Restaurants",
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const TrendingRestaurantPage()))),
              const TrendingRestaurants(scrollDirection: Axis.horizontal),

              //  Tops picks
              const Padding(
                padding: EdgeInsets.only(top: 20),
                child: ListTile(
                  title: Text(
                    "Top Picks",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
                  ),
                ),
              ),
              const TopPicks()
            ],
          ),
        )),
      ),
    );
  }
}
