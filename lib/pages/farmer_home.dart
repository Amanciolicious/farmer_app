import 'package:flutter/material.dart';
import 'package:farmer_app/pages/login_page.dart'; // Import Login Page

class FarmerHomePage extends StatefulWidget {
  const FarmerHomePage({super.key});

  @override
  State<FarmerHomePage> createState() => _FarmerHomePageState();
}

class _FarmerHomePageState extends State<FarmerHomePage> {
  final List<Map<String, String>> products = [
    {"name": "Tomatoes", "quantity": "20 kg", "price": "\$30"},
    {"name": "Cabbages", "quantity": "15 kg", "price": "\$25"},
    {"name": "Potatoes", "quantity": "50 kg", "price": "\$50"},
    {"name": "Carrots", "quantity": "10 kg", "price": "\$15"},
  ];

  // Logout function
  void _logout(BuildContext context) {
    // Clear session or authentication data if necessary
    // Example: SharedPreferences, FirebaseAuth, or other session management

    // Navigate to the login page and clear navigation stack
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
      (Route<dynamic> route) => false, // Remove all previous routes
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.green.shade700),
              child: const Text(
                "Farmer Panel",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Home"),
              onTap: () {
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: const Icon(Icons.account_circle),
              title: const Text("Profile"),
              onTap: () {
                // Navigate to Profile Page (or any other page)
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text("Settings"),
              onTap: () {
                // Navigate to Settings Page
                Navigator.pop(context); // Close the drawer
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.exit_to_app, color: Colors.red),
              title: const Text("Logout"),
              onTap: () => _logout(context), // Logout on tap
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text("Farmer Dashboard"),
        backgroundColor: Colors.green.shade700,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Welcome Banner
            Card(
              color: Colors.green.shade100,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome, Farmer John!",
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                color: Colors.green.shade900,
                                fontWeight: FontWeight.bold,
                              ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                        "Here’s a quick overview of your farm's performance today."),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Quick Actions
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildQuickAction(
                    "Add Product", Icons.add_circle, Colors.green),
                _buildQuickAction(
                    "View Listings", Icons.list_alt, Colors.orange),
                _buildQuickAction(
                    "Check Orders", Icons.shopping_cart, Colors.blue),
              ],
            ),
            const SizedBox(height: 20),
            // Products Section
            Text(
              "Your Products",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      leading:
                          const Icon(Icons.local_florist, color: Colors.green),
                      title: Text(product["name"]!),
                      subtitle: Text(
                          "Quantity: ${product["quantity"]}, Price: ${product["price"]}"),
                      trailing: IconButton(
                        icon: const Icon(Icons.edit, color: Colors.green),
                        onPressed: () {
                          // Navigate to Edit Product Page
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Navigate to Add Product Page
        },
        icon: const Icon(Icons.add),
        label: const Text("Add Product"),
        backgroundColor: Colors.green.shade700,
      ),
    );
  }

  Widget _buildQuickAction(String title, IconData icon, Color color) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: color.withOpacity(0.2),
          child: Icon(icon, color: color, size: 30),
        ),
        const SizedBox(height: 5),
        Text(title, style: const TextStyle(fontSize: 14)),
      ],
    );
  }
}
