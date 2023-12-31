import 'package:flutter/material.dart';

//void main() => runApp(const NavigationDrawer());

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({super.key});

  static const appTitle = 'Titolo';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: appTitle,
      home: _NavigationDrawer(title: appTitle),
    );
  }
}

class _NavigationDrawer extends StatelessWidget {
  const _NavigationDrawer({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return 
      //Scaffold(
      //appBar: AppBar(title: Text(title)),
      //body: const Center(
      //  child: Text('My Page!'),
      //),
      //drawer: 
      Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      );
  //  );
  }
}