import 'package:flutter/material.dart';
import 'package:kxiter/src/apis/book_api.dart';

class BooksListScreen extends StatefulWidget {
  final String title;
  const BooksListScreen({super.key, required this.title});

  @override
  State<BooksListScreen> createState() => _BooksListScreenState();
}

class _BooksListScreenState extends State<BooksListScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text(widget.title), Text('View all')],
        ),
        SizedBox(height: 20),
        FutureBuilder(
          future: getPosts(),
          builder: (context, snapshot) {
            return Container(
                height: 260,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(right: 15),
                      width: 110,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: AssetImage('assets/images/djo.jpeg'),
                                    fit: BoxFit.cover)),
                          ),
                          Text(
                            snapshot.data!.title!,
                            softWrap: false,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(snapshot.data!.authors![0]),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [Text('Start'), Text('(5.0)')],
                          )
                        ],
                      ),
                    );
                  },
                ));
          },
        ),
      ],
    );
  }
}
