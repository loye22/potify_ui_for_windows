import 'package:flutter/material.dart';
import 'package:potify_ui/data/data.dart';

class playListheader extends StatelessWidget {
  //const playListheader({Key? key}) : super(key: key);
  final Playlist playlist;

  const playListheader({Key? key, required this.playlist}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'assets/lofigirl.jpg',
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(12),
                margin: EdgeInsets.all(12),
                width: double.infinity,
                height: 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('playlist'),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      playlist.name,
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(playlist.description),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                        'Creat by' + playlist.creator + ' ' + playlist.duration)
                  ],
                ),
              ),
            )
          ],
        ),
        //  SizedBox(height: 5,),
        Row(
          children: [
            TextButton(
              onPressed: () {},
              child: Text(
                '     play     ',
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w200),
              ),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ))),
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.favorite_border)),
            IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz)),
            Spacer(),
            Column(
              children: [Text('Follwers'), Text(playlist.followers)],
            )
          ],
        )
      ],
    );
  }
}
