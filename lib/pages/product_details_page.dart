import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../data/products.dart';
import '../models/product.dart';
import 'cart_page.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({super.key, required this.product});

  final Product product;

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  bool showingMore = false;

  void _addToCart(BuildContext context) {
    // Mock adding the product to the cart (Replace with real implementation)
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("${widget.product.name} added to cart"),
      ),
    );

    // Navigate back to the product list for further selection
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Product Image
          Container(
            height: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(widget.product.image),
              ),
            ),
          ),
          const SizedBox(height: 16),
          // Product Name
          Text(
            widget.product.name,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 5),
          // Price and Availability
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Available in stock"),
              Text(
                "\$${widget.product.price.toStringAsFixed(2)}/${widget.product.unit}",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
          const SizedBox(height: 20),
          // Description
          Text(
            "Description",
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(widget.product.description),
          const SizedBox(height: 20),
          // Add to Cart Button
          ElevatedButton.icon(
            onPressed: () => _addToCart(context),
            icon: const Icon(IconlyLight.bag2),
            label: const Text("Add to Cart"),
          ),
        ],
      ),
    );
  }
}
