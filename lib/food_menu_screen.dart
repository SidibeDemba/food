// food_menu_screen.dart
import 'package:flutter/material.dart';

class FoodMenuScreen extends StatefulWidget {
  @override
  _FoodMenuScreenState createState() => _FoodMenuScreenState();
}

class _FoodMenuScreenState extends State<FoodMenuScreen> {
  final List<String> foodList = [
    "Hamburger 70 asset/image/Kebab.jpeg",
    "Café 40 asset/image/Café.jpeg",
    "Kebab 40 asset/image/Kebab.jpeg",
    "Shawarma 70 asset/image/Shawarma.jpeg",
    "Sandwich 40 asset/image/Sandwich.jpeg",
    "Tacos 130 asset/image/Tacos.jpeg",
    "Pizza 150 asset/image/Pizza.jpeg",
    "Jus-cocktail 100 asset/image/Jus_cocktail.jpeg",
    "Jus-orange 70 asset/image/Jus_orange.jpeg",
    "Jus-mangue 70 asset/image/Jus_mangue.jpeg",
    "Jus-chocolat 70 asset/image/Jus_chocolat.jpeg",
  ];

  // Liste pour stocker les articles sélectionnés
  List<String> selectedItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
      ),
      body: ListView(
        children: buildMenuItems(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Affichez la commande lorsque le bouton est appuyé
          showOrderDialog();
        },
        child: Icon(Icons.shopping_cart),
      ),
    );
  }

  List<Widget> buildMenuItems() {
    List<Widget> items = [];

    for (String foodItem in foodList) {
      items.add(buildMenuItem(foodItem));
    }

    return items;
  }

  Widget buildMenuItem(String menuItem) {
    // Divise la chaîne en nom et prix
    List<String> parts = menuItem.split(' ');
    String itemName = parts.sublist(0, parts.length - 1).join(' ');
    String itemPrice = parts.sublist(1, parts.length - 1).join(' ');
    String itemImage = parts.last;

    return ListTile(
      leading: Image.asset(itemImage,
      width: 80,),
      title: Text(itemName),
      subtitle: Text('Prix: $itemPrice MRU'),
      onTap: () {
        // Ajoutez l'élément sélectionné à la liste
        setState(() {
          selectedItems.add(menuItem);
        });
      },
    );
  }

  void showOrderDialog() {
    // Affiche une boîte de dialogue avec les articles sélectionnés
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Votre commande'),
          content: Column(
            children: [
              for (String selectedItem in selectedItems) Text(selectedItem),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                // Réinitialise la liste des articles sélectionnés
                setState(() {
                  selectedItems.clear();
                });
                Navigator.pop(context);
              },
              child: Text('Fermer'),
            ),
          ],
        );
      },
    );
  }
}
