import 'package:flutter/material.dart';
import 'package:spotify/spotify.dart';

class MusicPlayerScreen extends StatefulWidget {
  const MusicPlayerScreen({super.key});

  @override
  State<MusicPlayerScreen> createState() => _MusicPlayerScreenState();
}

class _MusicPlayerScreenState extends State<MusicPlayerScreen> {
  String ClientID = 'f52c81eb11824f8fb6e9fdeb98336cd7';
  String ClientSecret = '5e473b6b9d9b4debb966cd85f6690904';
  @override
  void initState() async{
    final credentials = SpotifyApiCredentials(ClientID, ClientSecret);
    final spotify = SpotifyApi(credentials);
    final artist = await spotify.artists.get('0OdUWJ0sBjDrqHygGUXeCF');   
   super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            const Center(
                child: Column(
              children: [
                Text('Playing from'),
                Text('Late Night Vibes'),
              ],
            )),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                  image: DecorationImage(
                      image: AssetImage('assets/images/images.jpeg'),
                      fit: BoxFit.cover)),
              height: 300,
            ),
            Row(
              children: [
                Text('han soo hee'),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
