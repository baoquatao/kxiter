import 'package:flutter/material.dart';
import 'package:kxiter/src/apis/book_api.dart';
import 'package:kxiter/src/models/List_model.dart';
import 'package:kxiter/src/views/book/book_details_screen.dart';

class BooksListScreen extends StatefulWidget {
  final String title;
  const BooksListScreen({super.key, required this.title});

  @override
  State<BooksListScreen> createState() => _BooksListScreenState();
}

class _BooksListScreenState extends State<BooksListScreen> {
  late Future<ListBook> futureList;
  @override
  void initState() {
    super.initState();
    futureList = getBooks();
  }

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
          future: futureList,
          builder: (context, snapshot) {
            // if (snapshot.hasData) {
            //   print('object');
            // } else {
            //   print('lol');
            // }
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BookDetailsScreen()));
              },
              child: Container(
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
                                      image: NetworkImage(snapshot
                                              .data?.imgUrl ??
                                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTwLgZa6l5fqjviYpia0CIbxKgRfS4zsXavNg&s'),
                                      fit: BoxFit.cover)),
                            ),
                            Text(
                              snapshot.data?.title ?? '',
                              softWrap: false,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(snapshot.data?.authors?[0] ?? ''),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [Text('Start'), Text('(5.0)')],
                            )
                          ],
                        ),
                      );
                    },
                  )),
            );
          },
        ),
      ],
    );
  }
}
