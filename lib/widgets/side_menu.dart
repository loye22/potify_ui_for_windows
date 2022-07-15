import 'package:flutter/material.dart';
import 'package:potify_ui/widgets/theLibary.dart';

class sideMenu extends StatelessWidget {
  // const sideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: double.infinity,
      height: double.infinity,
      width: 280,
      color: Theme.of(context).primaryColor,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(16),
                child: Image.asset(
                  'assets/spotify_logo.png',
                  height: 55,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16, left: 16),
            child: GestureDetector(
                onTap: () {
                  print('work');
                },
                child: ListTile(
                  leading: Icon(Icons.home),
                  title: Text('Home'),
                  onTap: () {},
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16, left: 16),
            child: GestureDetector(
                onTap: () {},
                child: ListTile(
                  leading: Icon(Icons.search),
                  title: Text('Search'),
                  onTap: (){},
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16, left: 16),
            child: GestureDetector(
                onTap: () {},
                child: ListTile(
                  leading: Icon(Icons.music_note),
                  title: Text('Radio'),
                  onTap: (){},
                )),
          ),
          SizedBox(
            height: 12,
          ),
          theLibary()
        ],
      ),
    );
  }
}
