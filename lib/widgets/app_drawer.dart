import 'package:flutter/material.dart';
import 'package:flutter_news/models/menu.dart';

class AppDrawer extends StatelessWidget {
  AppDrawer({super.key});

  final List<Menu> menuItems = [
    Menu(slug: 'general', label: 'General', icon: const Icon(Icons.list)),
    Menu(slug: 'business', label: 'Business', icon: const Icon(Icons.money)),
    Menu(
        slug: 'entertainment',
        label: 'Entertainment',
        icon: const Icon(Icons.video_call)),
    Menu(
        slug: 'health',
        label: 'Health',
        icon: const Icon(Icons.health_and_safety)),
    Menu(slug: 'science', label: 'Science', icon: const Icon(Icons.science)),
    Menu(slug: 'sports', label: 'Sports', icon: const Icon(Icons.games)),
    Menu(
        slug: 'technology',
        label: 'Technology',
        icon: const Icon(Icons.router)),
  ];

  List<Widget> buildDrawerList(BuildContext context) {
    List<Widget> drawerList = [];
    drawerList.add(const DrawerHeader(
      decoration: BoxDecoration(color: Colors.blue),
      child: Text(
        'News Application',
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.amberAccent),
      ),
    ));

    for (Menu menuItem in menuItems) {
      drawerList.add(ListTile(
        leading: menuItem.icon,
        title: Text(menuItem.label.toString()),
        onTap: null,
      ));
    }

    return drawerList;
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: buildDrawerList(context),
      ),
    );
  }
}
