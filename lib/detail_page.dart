import 'package:flutter/material.dart';
import 'package:restoranku/restaurant.dart';

class RestaurantDetailPage extends StatelessWidget {
  static const routeName = '/restaurant_detail';

  final RestaurantElement restaurant;
  const RestaurantDetailPage({required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(restaurant.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Hero(
              tag: restaurant.pictureId,
              child: Image.network(restaurant.pictureId),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      restaurant.name,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Icon(Icons.location_on_outlined),
                        Text('  ${restaurant.city}'),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Icon(Icons.star_outline),
                        Text('  ${restaurant.rating}'),
                      ],
                    ),
                    Divider(color: Colors.grey),
                    SizedBox(height: 15),
                    Text(
                      'Description',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(restaurant.description),
                    Divider(color: Colors.grey),
                    SizedBox(height: 15),
                    Text(
                      'Menus',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.restaurant,
                                      size: 20,
                                    ),
                                    Text(
                                      ' Foods',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: restaurant.menus.foods
                                      .map((e) => Text('- ' + e.name))
                                      .toList(),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.emoji_food_beverage_rounded,
                                      size: 20,
                                    ),
                                    Text(
                                      ' Drinks',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: restaurant.menus.drinks
                                      .map((e) => Text('- ' + e.name))
                                      .toList(),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
