import 'package:flutter/material.dart';
import '../widgets/product_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final List<Map<String, dynamic>> products = const [
   
    {
      'title': 'Modern Lamp',
      'subtitle': 'Home Decor',
      'price': 'RWF 25,000',
      'image': 'https://images.unsplash.com/photo-1505691938895-1758d7feb511'
    },
    {
      'title': 'Modern Lamp',
      'subtitle': 'Home Decor',
      'price': 'RWF 25,000',
      'image': 'https://images.unsplash.com/photo-1505691938895-1758d7feb511'
    },
    {
      'title': 'Modern Lamp',
      'subtitle': 'Home Decor',
      'price': 'RWF 25,000',
      'image': 'https://images.unsplash.com/photo-1505691938895-1758d7feb511'
    },
    {
      'title': 'Modern Dining Table',
      'subtitle': 'Home Decor',
      'price': 'RWF 25,000',
      'image': 'https://plus.unsplash.com/premium_photo-1673214881759-4bd60b76acae?q=80&w=580&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explore Products'),
        centerTitle: true,
        actions: const [
          Icon(Icons.favorite_border),
          SizedBox(width: 8),
          Icon(Icons.shopping_cart_outlined),
          SizedBox(width: 10),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
           const DrawerHeader(
           decoration: BoxDecoration(
           color: Color.fromARGB(255, 104, 71, 59),
           ),
         margin: EdgeInsets.zero, // remove default margin
        padding: EdgeInsets.all(4), // reduce padding
        child: Align(
          alignment: Alignment.centerLeft, // optional, aligns text to left
    child: Text(
      'Menu',
      style: TextStyle(color: Colors.white, fontSize: 20), // smaller font
    ),
  ),
),
            _buildDrawerItem(Icons.home, 'Home'),
            _buildDrawerItem(Icons.explore, 'Explore'),
            _buildDrawerItem(Icons.store, 'Vendors'),
            _buildDrawerItem(Icons.info_outline, 'About'),
            _buildDrawerItem(Icons.favorite_border, 'Wishlist'),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 94, 53, 38),
                  minimumSize: const Size(double.infinity, 40),
                ),
                child: const Text(
                  'Login', 
                  style:TextStyle(color:Colors.white),),
              ),
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: products.length,
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) {
          final item = products[index];
          return ProductCard(
            title: item['title'],
            subtitle: item['subtitle'],
            price: item['price'],
            imageUrl: item['image'],
          );
        },
      ),
    );
  }

  ListTile _buildDrawerItem(IconData icon, String label) {
    return ListTile(
      leading: Icon(icon),
      title: Text(label),
      onTap: () {},
    );
  }
}
