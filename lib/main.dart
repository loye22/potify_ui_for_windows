import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:potify_ui/Proovider.dart';
import 'package:potify_ui/data/data.dart';
import 'package:potify_ui/screens/playListScreen.dart';
import 'dart:io';

import 'package:potify_ui/widgets/side_menu.dart';
import 'package:provider/provider.dart';

import 'widgets/current_song_bar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (!kIsWeb && (Platform.isWindows || Platform.isLinux || Platform.isMacOS)) {
    await DesktopWindow.setMinWindowSize(const Size(1500,800 ));
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx)=> currentSong(),
      child: MaterialApp(
        title: 'Flutter Spotify UI',
        debugShowCheckedModeBanner: false,
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
          scaffoldBackgroundColor: const Color(0xFF121212),
          backgroundColor: const Color(0xFF121212),
          primaryColor: Colors.black,
          accentColor: const Color(0xFF1DB954),
          iconTheme: const IconThemeData().copyWith(color: Colors.white),
          fontFamily: 'Montserrat',
          textTheme: TextTheme(
            headline2: const TextStyle(
              color: Colors.white,
              fontSize: 32.0,
              fontWeight: FontWeight.bold,
            ),
            headline4: TextStyle(
              fontSize: 15.0,
              color: Colors.grey[300],
              fontWeight: FontWeight.w900,
              letterSpacing: 2.0,
            ),
            bodyText1: TextStyle(
              color: Colors.grey[300],
              fontSize: 14.0,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.0,
            ),
            bodyText2: TextStyle(
              color: Colors.grey[300],
              letterSpacing: 1.0,
            ),
          ),
        ),
        home: shell(),
      ),
    );
  }
}

class shell extends StatelessWidget {
  const shell({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                sideMenu(),
                Expanded(child: playListScreen(playlist: lofihiphopPlaylist,)),
              ],
            ),
          ),
         currentSongBar()
        ],
      ),
    );
  }
}
