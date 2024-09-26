import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: AppBar(
          backgroundColor: Colors.lightGreen,
          title: Text('Flutter is Fun'),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            print('Pressed!');
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.greenAccent,
          items: [
          BottomNavigationBarItem(
            
            icon: Icon(Icons.home, color: Colors.blueAccent,),
       
            label: 'Home',
               ),
               BottomNavigationBarItem(
                icon: Icon(Icons.business, color: Colors.blueAccent,),
                label: 'Business',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.school, color: Colors.blueAccent,),
                  label: 'School',
                  )
        ]),
        drawer: Drawer(
          backgroundColor: Colors.white,
          child: Text('Yooo!'),
          ),
      ),
    );
  }
}
