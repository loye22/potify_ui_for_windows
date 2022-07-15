import 'package:flutter/material.dart';
import 'package:potify_ui/data/data.dart';

class theLibary extends StatefulWidget {
  //const theLibary({Key? key}) : super(key: key);

  @override
  State<theLibary> createState() => _theLibaryState();
}

class _theLibaryState extends State<theLibary> {
  ScrollController _c  = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        controller: _c,
        padding: EdgeInsets.symmetric(horizontal: 12),
        physics: ClampingScrollPhysics(),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: Text(
                  'Your Libary',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
              ...yourLibrary
                  .map((e) => ListTile(
                        title: Text(
                          e,
                          style: Theme.of(context).textTheme.bodyText2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        onTap: () {},
                      ))
                  .toList()
            ],
          ) ,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: Text(
                  'Play List',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
              ...playlists
                  .map((e) => ListTile(
                title: Text(
                  e,
                  style: Theme.of(context).textTheme.bodyText2,
                  overflow: TextOverflow.ellipsis,
                ),
                onTap: () {},
              ))
                  .toList()
            ],
          )
        ],
      ),
    );
  }
}
