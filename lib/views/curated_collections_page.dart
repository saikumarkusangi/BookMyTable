import 'package:dinner_is_done/themes/themes.dart';
import 'package:dinner_is_done/utils/curated_collections.dart';
import 'package:flutter/material.dart';


class CuratedCollectionsPage extends StatefulWidget {
  const CuratedCollectionsPage({super.key});

  @override
  State<CuratedCollectionsPage> createState() => _CuratedCollectionsPageState();
}

class _CuratedCollectionsPageState extends State<CuratedCollectionsPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Themes.backgroundColor,
        centerTitle: true,
        title: const Text("Curated Collections",style: TextStyle(
          color: Colors.black
        ),),
      ),
      body:  SingleChildScrollView(
        child: Expanded(
          child: Column(
            children:const [
              CuratedCollections(crossAxisCount: 1,childAxisRatio:2),
            ],
          ),
        ),
      ));
  }
}