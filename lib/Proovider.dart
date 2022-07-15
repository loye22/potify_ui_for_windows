import 'package:flutter/foundation.dart';
import 'package:potify_ui/data/data.dart';



class currentSong with ChangeNotifier {

  Song song =Song(
    id: '11',
    title: 'Arizona Zero',
    artist: 'WYS, Sweet Medicine',
    album: 'Evermore',
    duration: '2:31',
  );

void selected (Song s){
  song = s ;
  print(song.title);
  notifyListeners();
  }




}