import 'package:flutter/material.dart';

import '../themes/themes.dart';

class DetailsPage extends StatelessWidget {
  final String image;
  final String name;
  final String rating;
  final String mobile;
  final String menu;
  final String description;

  const DetailsPage({
    super.key,
    required this.description,
    required this.image,
    required this.name,
    required this.rating,
    required this.mobile,
    required this.menu,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar.large(
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
              automaticallyImplyLeading: false,
              expandedHeight: 300,
              flexibleSpace: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(image), fit: BoxFit.cover)),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.all(20),
              sliver: SliverList(delegate: SliverChildListDelegate([
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                    
                      child: Text(name,style: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.bold,
                        fontSize: 28
                      ),
                      maxLines: 2,
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
                  ],
                ),
                const SizedBox(height: 20,),
                Text(description,style: const TextStyle(
                  fontSize: 18,
                  color: Themes.lightBlack
                ),),
                const SizedBox(height: 20,),
                ListTile(leading: Icon(Icons.call),
                title: Text(mobile),),
                 const SizedBox(height: 20,),
                 Card(
                  elevation: 6,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: ListTile(
                     
                       leading: Image.network("https://media.istockphoto.com/id/658262954/vector/dining-table-and-chairs-with-wine.jpg?s=612x612&w=0&k=20&c=tSSEfw1OlcZRu4yfz1Nd_48nHjXrNIzO3ScZ50VMuGc=",width: 50,),
                      title:  Text("Reserve a Table",style: TextStyle(
                          fontSize: 22
                        ))
                    ),
                  ),
                 ),
                                  const SizedBox(height: 20,),
                 Card(
                  elevation: 6,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: ListTile(
                      
                       leading: Image.network("https://static.vecteezy.com/system/resources/thumbnails/014/578/213/small/restaurant-man-waiter-icon-flat-style-vector.jpg",width: 50,),
                       title: Text("Order a Table",style: TextStyle(
                          fontSize: 22
                        ),),
                    ),
                  ),
                 ),
                 const SizedBox(height: 20,),
                 Text("menu",style: TextStyle(fontSize: 28),),
                 const SizedBox(height: 20,),
                 Container(
                  width: double.maxFinite,
                  
                  child: Image.network(menu,fit: BoxFit.cover,),

                 )
              ])),
            )
          ],
        ),
      ),
    );
  }
}
