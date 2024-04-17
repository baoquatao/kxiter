import 'package:flutter/material.dart';
import 'package:kxiter/src/views/search/search_scren.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SearchScreen(),
            ));
      },
      child: Container(
          alignment: Alignment.centerLeft,
          width: double.infinity,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 241, 239, 239),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Row(
            children: [
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Icon(Icons.search)),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Text('Search'))
            ],
          )),
    );
  }
}
