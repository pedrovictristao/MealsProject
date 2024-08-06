import 'package:flutter/material.dart';
import 'package:meals/screens/category_meals_screen.dart';
import 'package:meals/screens/meal_detail_screen.dart';
import 'package:meals/utils/app_routes.dart';
import 'screens/categories_screen.dart';
//import 'screens/categories_meals_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vamos Cozinhar?',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.pink,
          secondary: Colors.amber,
        ),
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              titleLarge: const TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
              ),
            ),
      ),
      routes: {
        AppRoutes.HOME: (ctx) => const CategoriesScreen(),
        AppRoutes.CATEGORIES_MEAL: (ctx) => const CategoriesMealsScreen(),
        AppRoutes.MEAL_DETAILS: (ctx) => const MealDetailScreen(),
      },
    );
  }
}
