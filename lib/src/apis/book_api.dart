import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kxiter/src/models/List_model.dart';

// const url = 'https://api.algobook.info/v1/ebooks/title/Lord%20of%20the%20rings';
const url =
    'https://e-book-api-algobook.p.rapidapi.com/v1/ebooks/isbn/9781101147054';
Future<ListBook> getBooks() async {
  var url1 = Uri.parse(url);
  final response = await http.get(
    url1,
    headers: {
      'X-RapidAPI-Key': '34602dc201mshaf2565bc90a5bf8p15c0c7jsnbea3da497428',
      'X-RapidAPI-Host': 'e-book-api-algobook.p.rapidapi.com'
    },
  );
  if (response.statusCode == 200) {
    print(response.body);
    return ListBook.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed');
  }
  // return body.map((e) => ListBook.fromJson(e)).toList();
}
