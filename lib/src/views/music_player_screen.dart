import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:spotify/spotify.dart';

class MusicPlayerScreen extends StatefulWidget {
  const MusicPlayerScreen({super.key});

  @override
  State<MusicPlayerScreen> createState() => _MusicPlayerScreenState();
}

class _MusicPlayerScreenState extends State<MusicPlayerScreen> {
  String ClientID = 'f52c81eb11824f8fb6e9fdeb98336cd7';
  String ClientSecret = '5e473b6b9d9b4debb966cd85f6690904';
  // @override
  // void initState() async {
  //   final credentials = SpotifyApiCredentials(ClientID, ClientSecret);
  //   final spotify = SpotifyApi(credentials);
  //   final artist = await spotify.artists.get('0OdUWJ0sBjDrqHygGUXeCF');
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ShaderMask(
        shaderCallback: (bounds) {
          return LinearGradient(
            colors: [
              Colors.white,
            ],
            stops: [0.0],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ).createShader(bounds);
        },
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 46, 39, 39),
              const Color.fromARGB(255, 49, 123, 184)
            ],
          )),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(children: [
                const Center(
                    child: Column(
                  children: [
                    Text(
                      'Playing from',
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      'Top 50 - Global',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                )),
                Container(
                  margin: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                      image: DecorationImage(
                          image: AssetImage('assets/images/djo.jpeg'),
                          fit: BoxFit.cover)),
                  height: 400,
                ),
                const Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'End of Beginning',
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            'Djo',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      Icon(
                        CupertinoIcons.heart,
                        color: Colors.white,
                      )
                    ],
                  ),
                )
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
