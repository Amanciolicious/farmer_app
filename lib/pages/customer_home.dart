import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:farmer_app/pages/cart_page.dart';
import 'package:farmer_app/pages/profile_page.dart';
import 'package:farmer_app/pages/services_page.dart';
import 'package:farmer_app/widgets/product_card.dart';
import '../data/products.dart';

class CustomerHome extends StatefulWidget {
  const CustomerHome({super.key});

  @override
  _CustomerHomeState createState() => _CustomerHomeState();
}

class _CustomerHomeState extends State<CustomerHome> {
  int currentIndex = 0;

  // List of pages corresponding to the bottom navigation items
  final List<Widget> _pages = [
    const HomePage(),  // Home Page (Customer Home)
    const ServicesPage(),  // Services Page
    const CartPage(cartItems: []),  // Cart Page
     ProfilePage(),  // Profile Page
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Customer Home"),
        actions: [
          IconButton(
            icon: const Icon(IconlyLight.search),
            onPressed: () {},
          ),
        ],
      ),
      body: _pages[currentIndex], // Displays the page based on the currentIndex
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex, // Highlight the selected tab
        onTap: (index) {
          setState(() {
            currentIndex = index; // Change the page based on the index
          });
        },
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(IconlyLight.home),
            activeIcon: Icon(IconlyBold.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(IconlyLight.call),
            activeIcon: Icon(IconlyBold.call),
            label: "Services",
          ),
          BottomNavigationBarItem(
            icon: Icon(IconlyLight.buy),
            activeIcon: Icon(IconlyBold.buy),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(IconlyLight.profile),
            activeIcon: Icon(IconlyBold.profile),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // Filter and Search Text Field
        Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search here...",
                    isDense: true,
                    contentPadding: const EdgeInsets.all(12),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.shade300,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(99)),
                    ),
                    prefixIcon: const Icon(IconlyLight.search),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: IconButton.filled(
                  onPressed: () {},
                  icon: const Icon(IconlyLight.filter),
                ),
              ),
            ],
          ),
        ),
        // Consultation Card
        Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: SizedBox(
            height: 170,
            child: Card(
              color: Colors.green.shade50,
              elevation: 0.1,
              shadowColor: Colors.green.shade50,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    // Texts Statement
                    Flexible(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Free Consultation",
                            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              color: Colors.green.shade700,
                            ),
                          ),
                          const Text("Get free support from our customer service"),
                          FilledButton(onPressed: () {}, child: const Text("Call now")),
                        ],
                      ),
                    ),
                    // Image
                    Image.asset('contactus.png', width: 140),
                  ],
                ),
              ),
            ),
          ),
        ),
        // Featured Products
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Featured Products",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            TextButton(
              onPressed: () {},
              child: const Text("See all"),
            ),
          ],
        ),
        // Feature Products Grid
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: products.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1,
          ),
          itemBuilder: (context, index) {
            return ProductCard(product: products[index]);
          },
        ),
      ],
    );
  }
}
