
import 'package:flutter/material.dart';

class FoodSearchPage extends StatelessWidget {
  const FoodSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Food'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SearchBar(),
            const SizedBox(height: 16.0),
            Expanded(
              child: FoodList(),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Spice Food',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
        ),
        const SizedBox(width: 8.0),
        IconButton(
          icon: const Icon(Icons.filter_list),
          onPressed: () {},
        ),
      ],
    );
  }
}

class FoodList extends StatelessWidget {
  final List<FoodItem> foodItems = [
    FoodItem('Oni Sandwich', 'Spicy chicken sandwich', 69, 6.72, 'assets/adhicine.png'),
    FoodItem('Dan Noodles', 'Spicy fruit mixed', 120, 8.86, 'assets/adhicine.png'),
    FoodItem('Chicken Dimsum', 'Spicy chicken dimsum', 65, 6.99, 'assets/adhicine.png'),
    FoodItem('Egg Pasta', 'Spicy chicken pasta', 78, 9.80, 'assets/adhicine.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: foodItems.length,
      itemBuilder: (context, index) {
        return FoodCard(foodItem: foodItems[index]);
      },
    );
  }
}

class FoodItem {
  final String name;
  final String description;
  final int calories;
  final double price;
  final String imageUrl;

  FoodItem(this.name, this.description, this.calories, this.price, this.imageUrl);
}

class FoodCard extends StatelessWidget {
  final FoodItem foodItem;

  const FoodCard({required this.foodItem});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16.0),
        leading: Image.asset(foodItem.imageUrl),
        title: Text(foodItem.name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(foodItem.description),
            const SizedBox(height: 4.0),
            Text('${foodItem.calories} Calories'),
          ],
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('\$${foodItem.price.toStringAsFixed(2)}'),
          ],
        ),
      ),
    );
  }
}
