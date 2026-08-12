import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:multi_provider/provider_favourite_app.dart';

class FavouiteApp extends StatefulWidget {
  const FavouiteApp({super.key});

  @override
  State<FavouiteApp> createState() => _FavouiteAppState();
}

class _FavouiteAppState extends State<FavouiteApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Favourite App",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),

      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 100,
              itemBuilder: (context, index) {
                return Consumer<FavoriteApp>(
                  builder: (context, value, child) {
                    final isFavorite = value.isFavorite(index);

                    return ListTile(
                      onTap: () {
                        if (isFavorite) {
                          value.removeItem(index);
                        } else {
                          value.addItem(index);
                        }
                      },

                      leading: CircleAvatar(

                        child: Text(
                          "$index",
                        ),
                      ),

                      title: Text(
                        "APP $index",
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      trailing: Icon(
                        isFavorite
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: isFavorite
                            ? Colors.red
                            : Colors.grey,
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}