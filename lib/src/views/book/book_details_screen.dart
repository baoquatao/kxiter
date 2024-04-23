import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kxiter/src/apis/book_api.dart';
import 'package:kxiter/src/models/List_model.dart';

class BookDetailsScreen extends StatefulWidget {
  const BookDetailsScreen({super.key});

  @override
  State<BookDetailsScreen> createState() => _BookDetailsScreenState();
}

class _BookDetailsScreenState extends State<BookDetailsScreen> {
  late Future<ListBook> futureList;
  @override
  void initState() {
    super.initState();
    futureList = getBooks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        const Icon(Icons.bookmark),
        const Text(
          "|",
          style: TextStyle(fontSize: 30),
        ),
        const Icon(Icons.share)
      ]),
      body: FutureBuilder(
          future: futureList,
          builder: (context, snapshot) {
            return Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            child: Image(
                                image:
                                    NetworkImage(snapshot.data!.imgUrl ?? ''))),
                        const SizedBox(width: 10),
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                snapshot.data!.title ?? '',
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w800),
                              ),
                              Text(
                                snapshot.data!.authors![0],
                                style: const TextStyle(fontSize: 18),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                snapshot.data!.localizedDescription ?? '',
                                softWrap: true,
                                maxLines: 6,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(fontSize: 12),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.black),
                                    onPressed: () => print('object'),
                                    child: const Text(
                                      'Star Reading',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  const SizedBox(width: 15),
                                  const Icon(Icons.save_alt)
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Description',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            snapshot.data?.localizedDescription ?? '',
                            softWrap: true,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Row(children: [
                            const Text('Language: ',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600)),
                            const SizedBox(width: 5),
                            Text(snapshot.data?.language == 'en'
                                ? 'English'
                                : 'None')
                          ]),
                          Row(children: [
                            const Text('Publisher: ',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600)),
                            const SizedBox(width: 5),
                            Text(
                                '${snapshot.data?.publisher} (${snapshot.data?.published})')
                          ]),
                          Row(children: [
                            const Text('ISBN: ',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600)),
                            const SizedBox(width: 5),
                            Text(
                                snapshot.data?.identifiers?[0].identifier ?? '')
                          ]),
                          Row(children: [
                            const Text('Paperback: ',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600)),
                            const SizedBox(width: 5),
                            Text('${snapshot.data?.pages ?? 0}')
                          ]),
                        ]),
                    const Row(),
                    const Column()
                  ],
                ));
          }),
    );
  }
}
