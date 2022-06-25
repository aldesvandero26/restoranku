import 'package:flutter/material.dart';
import 'package:restoranku/restaurant.dart';
import 'package:restoranku/detail_page.dart';

class RestaurantListPage extends StatelessWidget {
  static const routeName = '/restaurant_article_list';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Restaurant App'),
      ),
      body: FutureBuilder<String>(
        future: DefaultAssetBundle.of(context)
            .loadString('assets/local_restaurant.json'),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          final restaurant = restaurantFromJson(snapshot.data!);
          return ListView.builder(
            itemCount: restaurant.restaurants.length,
            itemBuilder: (context, index) {
              return _buildRestaurantItem(
                  context, restaurant.restaurants[index]);
            },
          );
        },
      ),
    );
  }

  Widget _buildRestaurantItem(
      BuildContext context, RestaurantElement restaurant) {
    return Card(
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        leading: Hero(
          tag: restaurant.pictureId,
          child: Image.network(
            restaurant.pictureId,
            width: 100,
          ),
        ),
        title: Text(restaurant.name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(restaurant.city),
            Row(
              children: [
                Icon(Icons.star_outline, size: 15),
                Text(' ${restaurant.rating}'),
              ],
            ),
          ],
        ),
        onTap: () {
          Navigator.pushNamed(context, RestaurantDetailPage.routeName,
              arguments: restaurant);
        },
      ),
    );
  }
}
