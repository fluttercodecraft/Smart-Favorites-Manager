import 'package:flutter/material.dart';
import 'package:multi_provider/provider_favourite_app.dart';
import 'package:provider/provider.dart';

class FavouiteApp extends StatefulWidget {
  const FavouiteApp({super.key});

  @override
  State<FavouiteApp> createState() => _FavouiteAppState();
}

class _FavouiteAppState extends State<FavouiteApp> {
  @override
  Widget build(BuildContext context) {

    final favoriteProvider = Provider.of<FavoriteApp>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Favourite App"),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 100,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    if (favoriteProvider.isFavorite(index)) {
                      favoriteProvider.removeItem(index);
                    } else {
                      favoriteProvider.addItem(index);
                    }
                  },
                  title: Text(
                    "APP   $index",
                  ),
                  trailing: Icon(
                    favoriteProvider.isFavorite(index)
                        ? Icons.favorite
                        : Icons.favorite_border,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}