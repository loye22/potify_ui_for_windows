import 'package:flutter/material.dart';
import 'package:potify_ui/data/data.dart';
import 'package:potify_ui/widgets/play_list_header.dart';
import 'package:potify_ui/widgets/track_list.dart';

class playListScreen extends StatefulWidget {
  // const playListScreen({Key? key}) : super(key: key);
  final Playlist playlist;

  const playListScreen({Key? key, required this.playlist}) : super(key: key);

  @override
  State<playListScreen> createState() => _playListScreenState();
}

class _playListScreenState extends State<playListScreen> {
  ScrollController? _scrollController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _scrollController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leadingWidth: 1400,
          leading: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                InkWell(
                  customBorder: CircleBorder(),
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.black26),
                    child: Icon(Icons.chevron_left),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                  customBorder: CircleBorder(),
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.black26),
                    child: Icon(Icons.chevron_right),
                  ),
                )
              ],
            ),
          ),
          actions: [
            TextButton.icon(
                style: TextButton.styleFrom(
                    primary: Theme.of(context).iconTheme.color),
                onPressed: () {},
                icon: Icon(
                  Icons.account_circle_outlined,
                  size: 26,
                  color: Colors.white,
                ),
                label: Text(
                  'Louie',
                )),
            SizedBox(
              width: 16,
            ),
            IconButton(
                onPressed: () {}, icon: Icon(Icons.keyboard_arrow_down_sharp))
          ],
        ),
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.red, Colors.black87, Colors.transparent],
                  stops: [0.0, 0.3, .4],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
          child: ListView(
            controller: _scrollController,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 60),
            children: [
              playListheader(
                playlist: widget.playlist,
              ),
              trackList(song: widget.playlist.songs,)
            ],
          ),
        ));
  }
}
