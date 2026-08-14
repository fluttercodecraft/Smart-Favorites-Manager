import 'package:flutter/material.dart';
import 'package:multi_provider/like_screen.dart';
import 'package:multi_provider/provider_favourite_app.dart';
import 'package:provider/provider.dart';

class FavouriteApp extends StatefulWidget {
  const FavouriteApp({super.key});

  @override
  State<FavouriteApp> createState() => _FavouriteAppState();
}

class _FavouriteAppState extends State<FavouriteApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LikeScreen()),
              );
            },
            icon: const Icon(Icons.favorite,color: Colors.white,),
          ),
        ],
        backgroundColor: Colors.indigo,
        title: const Text(
          "Favourite App",
          style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
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
                leading: CircleAvatar(child: Text("$index")),
                title: Text(
                  "APP $index",
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
                trailing: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: isFavorite ? Colors.red : Colors.grey,
                ),
              );
            },
          );
        },
      ),
    );
  }
}