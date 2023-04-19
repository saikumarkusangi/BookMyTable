import 'package:dinner_is_done/themes/themes.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String image;
  final String name;
  final String description;
  final String rating;
  const CustomCard(
      {super.key,
      required this.description,
      required this.image,
      required this.rating,
      required this.name});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.maxFinite,
                height: 200,
                child: Image.network(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 20),
              title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Text(
                        name,
                        style: const TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Themes.secondtextColor),
                        maxLines: 1,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(6)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.white,
                            size: 18,
                          ),
                          Text(
                            rating,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                    ),
                  ]),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Text(
                    description,
                    overflow: TextOverflow.ellipsis,
                    style:
                        const TextStyle(fontSize: 18, color: Themes.lightBlack),
                        maxLines: 1,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
