import 'package:farmer_app/pages/cart_page.dart';
import 'package:farmer_app/pages/explore_page.dart';
import 'package:farmer_app/pages/profile_page.dart';
import 'package:farmer_app/pages/services_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:badges/badges.dart' as badges;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final pages = [
    const ExplorePage(),
    const ServicesPage(),
    const CartPage(cartItems: [],),
     ProfilePage()
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        centerTitle: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hi Amancio 🫀",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text("Enjoy our services.",
                style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton.filledTonal(
              onPressed: () {},
              icon: badges.Badge(
                badgeContent: const Text(
                  '3',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
                badgeStyle: const badges.BadgeStyle(
                  badgeColor: Colors.green,
                ),
                position: badges.BadgePosition.topEnd(top: -15, end: -12),
                child: const Icon(IconlyBroken.notification),
              ),
            ),
          )
        ],
      ),
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(IconlyLight.home),
              activeIcon: Icon(IconlyBold.home),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(IconlyLight.call),
              activeIcon: Icon(IconlyBold.call),
              label: "Services"),
          BottomNavigationBarItem(
              icon: Icon(IconlyLight.buy),
              activeIcon: Icon(IconlyBold.buy),
              label: "Cart"),
          BottomNavigationBarItem(
              icon: Icon(IconlyLight.profile),
              activeIcon: Icon(IconlyBold.profile),
              label: "Profile"),
        ],
      ),
    );
  }
}
