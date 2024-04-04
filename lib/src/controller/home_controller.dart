import 'dart:convert';

import 'package:kxiter/src/models/artist_models.dart';
import 'package:http/http.dart' as http;

Future<Artist> getArtist() async {
  var id = '0TnOYISbd1XYRBk9myaseg';

  final response =
      await http.get(Uri.parse('https://api.spotify.com/v1/artists/$id'));

  if (response.statusCode != 200) {
    print(response.body);
    return Artist.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    throw Exception('Failed to load album');
  }
}
