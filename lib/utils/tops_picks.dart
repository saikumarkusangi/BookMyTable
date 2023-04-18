import 'dart:ui';

import 'package:flutter/material.dart';

class TopPicks extends StatefulWidget {

  const TopPicks({
    super.key,});

  @override
  State<TopPicks> createState() => _TopPicksState();
}

class _TopPicksState extends State<TopPicks> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 9,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount:3,
        // childAspectRatio: widget.childAxisRatio,
      ),
      itemBuilder: (context, index) {
        return Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {},
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Card(
                    elevation: 40,
                    child: Container(
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSjfKm_Rb4sMK434oHnSLGb7D38GC9U00NM9ML8bUx1P9fNjP-wVr1ehBfHcS9b8GQkKtQ&usqp=CAU"))),
                     
                    ),
                  )),
            ));
      },
    );
  }
}
