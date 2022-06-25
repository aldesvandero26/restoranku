import 'package:flutter/material.dart';
import 'package:restoranku/restaurant.dart';
import 'package:restoranku/restaurant_list_page.dart';
import 'package:restoranku/detail_page.dart';
import 'package:restoranku/style.dart';
import 'package:restoranku/textTheme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant App',
      theme: ThemeData(
        colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: primaryColor,
              onPrimary: Colors.black,
              secondary: secondaryColor,
            ),
        textTheme: myTextTheme,
        appBarTheme: AppBarTheme(elevation: 0),
      ),
      initialRoute: RestaurantListPage.routeName,
      routes: {
        RestaurantListPage.routeName: (context) => RestaurantListPage(),
        RestaurantDetailPage.routeName: (context) => RestaurantDetailPage(
              restaurant: ModalRoute.of(context)?.settings.arguments
                  as RestaurantElement,
            )
      },
    );
  }
}
