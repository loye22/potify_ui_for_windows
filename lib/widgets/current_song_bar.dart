import 'package:flutter/material.dart';
import 'package:potify_ui/Proovider.dart';
import 'package:provider/provider.dart';

class currentSongBar extends StatelessWidget {
  //const currentSongBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<currentSong>(context);
    if (pro == null) {
      return SizedBox.shrink();
    }
    return Container(
      height: 100,
      width: double.infinity,
      // color: Colors.blue,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30), color: Colors.transparent),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
         // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.all(12),
              child: Image.asset(
                'assets/lofigirl.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  pro.song.title,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                SizedBox(height: 12,),
                Text(pro.song.artist,
                    style: TextStyle(color: Colors.grey, fontSize: 12))
              ],
            ) ,
            SizedBox(width: 10,),
            Icon(Icons.favorite_border) ,
            Spacer(),
            _PlayerControls() ,
            Spacer(),
            _MoreControls()
          ],
        ),
      ),
    );
  }
}

class _PlayerControls extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final selected = context.watch<currentSong>().song;
    return Column(
      children: [
        Row(
          children: [
            IconButton(
              padding: const EdgeInsets.only(),
              icon: const Icon(Icons.shuffle),
              iconSize: 20.0,
              onPressed: () {},
            ),
            IconButton(
              padding: const EdgeInsets.only(),
              icon: const Icon(Icons.skip_previous_outlined),
              iconSize: 20.0,
              onPressed: () {},
            ),
            IconButton(
              padding: const EdgeInsets.only(),
              icon: const Icon(Icons.play_circle_outline),
              iconSize: 34.0,
              onPressed: () {},
            ),
            IconButton(
              padding: const EdgeInsets.only(),
              icon: const Icon(Icons.skip_next_outlined),
              iconSize: 20.0,
              onPressed: () {},
            ),
            IconButton(
              padding: const EdgeInsets.only(),
              icon: const Icon(Icons.repeat),
              iconSize: 20.0,
              onPressed: () {},
            ),
          ],
        ),
        const SizedBox(height: 4.0),
        Row(
          children: [
            Text('0:00', style: Theme.of(context).textTheme.caption),
            const SizedBox(width: 8.0),
            Container(
              height: 5.0,
              width: MediaQuery.of(context).size.width * 0.3,
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(2.5),
              ),
            ),
            const SizedBox(width: 8.0),
            Text(
              selected?.duration ?? '0:00',
              style: Theme.of(context).textTheme.caption,
            ),
          ],
        ),
      ],
    );
  }
}



class _MoreControls extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.devices_outlined),
          iconSize: 20.0,
          onPressed: () {},
        ),
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.volume_up_outlined),
              onPressed: () {},
            ),
            Container(
              height: 5.0,
              width: 70.0,
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(2.5),
              ),
            ),
          ],
        ),
        IconButton(
          icon: const Icon(Icons.fullscreen_outlined),
          onPressed: () {},
        ),
      ],
    );
  }
}
