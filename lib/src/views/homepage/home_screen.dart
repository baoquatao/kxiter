import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kxiter/src/controller/home_controller.dart';
import 'package:kxiter/src/models/artist_models.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _selectedIndex = 0;
  late Future<Artist> Artists;
  @override
  void initState() {
    super.initState();
    Artists = getArtist();
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
            Column(
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text("Followed Artist"), Text('see all')],
                    ),
                    FutureBuilder<Artist>(
                      future: Artists,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Text(snapshot.data!.name!);
                        } else if (snapshot.hasError) {
                          return Text('${snapshot.error}');
                        }

                        // By default, show a loading spinner.
                        return const CircularProgressIndicator();
                      },
                    ),
                  ],
                )
              ],
            ),
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
            icon: Icon(Icons.search),
            title: Text('Search'),
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
