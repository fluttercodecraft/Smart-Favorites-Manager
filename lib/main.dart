import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:multi_provider/provider_favourite_app.dart';
import 'package:multi_provider/favourite_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => FavoriteApp(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple,
          ),
        ),
        home: const FavouriteApp(),
      ),
    );
  }
}