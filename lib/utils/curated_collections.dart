import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CuratedCollections extends StatefulWidget {
  final int crossAxisCount;
  final double childAxisRatio;
  const CuratedCollections({
    super.key, required this.crossAxisCount,
    required this.childAxisRatio});

  @override
  State<CuratedCollections> createState() => _CuratedCollectionsState();
}

class _CuratedCollectionsState extends State<CuratedCollections> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 4,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: widget.crossAxisCount,
        childAspectRatio: widget.childAxisRatio,
      ),
      itemBuilder: (context, index) {
        return Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {},
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    "https://pyt-blogs.imgix.net/2018/02/home-panel-11-1-1.jpg?auto=format&ixlib=php-3.3.0"))),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.3)),
                          ),
                        ),
                      )),
                  const Text(
                    "SS",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
                  )
                ],
              ),
            ));
      },
    );
  }
}
