import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kxiter/src/views/homepage/widget/books_list_screen.dart';
import 'package:kxiter/src/views/homepage/widget/search.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _selectedIndex = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          greeting(),
          style: const TextStyle(fontWeight: FontWeight.w700),
        ),
        actions: const [
          Icon(Icons.notifications),
          SizedBox(width: 10),
          Icon(Icons.settings),
          SizedBox(width: 10)
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(children: [
            Column(children: [
              Search(),
              SizedBox(height: 20),
              BooksListScreen(
                title: 'Trending Books',
              ),
              SizedBox(height: 20),
              BooksListScreen(
                title: 'Recommended Books',
              ),
              SizedBox(height: 20),
              BooksListScreen(title: 'Favourites Books')
            ]),
          ]),
        ),
      ),
      bottomNavigationBar: FlashyTabBar(
        selectedIndex: _selectedIndex,
        showElevation: true,
        onItemSelected: (index) => setState(() {
          _selectedIndex = index;
        }),
        items: [
          FlashyTabBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          FlashyTabBarItem(
            icon: Icon(Icons.book_outlined),
            title: Text('Collection'),
          ),
          FlashyTabBarItem(
            icon: Icon(CupertinoIcons.heart),
            title: Text('Favorites'),
          ),
          FlashyTabBarItem(
            icon: Icon(CupertinoIcons.person),
            title: Text('Users'),
          ),
        ],
      ),
    );
  }
}

String greeting() {
  var hour = DateTime.now().hour;
  if (hour < 12) {
    return 'Good Morning';
  }
  if (hour < 17) {
    return 'Good Afternoon';
  }
  return 'Good Evening';
}
