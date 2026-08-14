import 'package:flutter/material.dart';
import 'package:multi_provider/provider_favourite_app.dart';
import 'package:provider/provider.dart';

class LikeScreen extends StatelessWidget {
  const LikeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Favorite Items",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Consumer<FavoriteApp>(
        builder: (context, value, child) {
          // If no items are favorited yet
          if (value.selectedItems.isEmpty) {
            return const Center(
              child: Text(
                "No favorites added yet!",
                style: TextStyle(fontSize: 16),
              ),
            );
          }

          return ListView.builder(
            itemCount: value.selectedItems.length,
            itemBuilder: (context, index) {
              // Extract the actual item index saved in the favorites list
              final itemIndex = value.selectedItems[index];

              return ListTile(
                onTap: () {
                  value.removeItem(itemIndex);
                },
                leading: CircleAvatar(child: Text("$itemIndex")),
                title: Text(
                  "APP $itemIndex",
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
                trailing: const Icon(
                  Icons.favorite,
                  color: Colors.red,
                ),
              );
            },
          );
        },
      ),
    );
  }
}