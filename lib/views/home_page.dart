import 'package:dinner_is_done/common/list_tile.dart';
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
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Themes.backgroundColor,
          leadingWidth: MediaQuery.of(context).size.width / 3,
          leading: Row(children: [
            const Icon(
              Icons.location_pin,
              color: Themes.accentColor,
              size: 24,
            ),
            Expanded(
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 3,
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
        ),
        body: SingleChildScrollView(
          child:Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
          
            // banner 
          
             Image.asset("assets/images/bg.png"),
          
            //  Curated Collections
              
              CommonListTile(label: "Curated Collections", onTap:()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>const CuratedCollectionsPage())) ),
              const CuratedCollections(crossAxisCount: 2,childAxisRatio: 1.5,),
                
              // Trending Restaurants
              
               CommonListTile(label: "Trending Restaurants", onTap:(){} ),
               const TrendingRestaurants()
              ],
            ),
          )
           
        ),
      ),
    );
  }
}
