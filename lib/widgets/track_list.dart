import 'package:flutter/material.dart';
import 'package:potify_ui/Proovider.dart';
import 'package:potify_ui/data/data.dart';
import 'package:provider/provider.dart';

class trackList extends StatefulWidget {
//  const trackList({Key? key}) : super(key: key);
  final List<Song> song;

  const trackList({Key? key, required this.song}) : super(key: key);

  @override
  State<trackList> createState() => _trackListState();
}

class _trackListState extends State<trackList> {
  List<bool> _selected = [];

  @override
  void initState() {
    super.initState();
    _selected = List<bool>.generate(widget.song.length, (int index) => false);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: DataTable(
        showCheckboxColumn: false,
        columns: const [
          DataColumn(label: Text('Title')),
          DataColumn(label: Text('Artist')),
          DataColumn(label: Text('Album')),
          DataColumn(label: Icon(Icons.access_time)),
        ],
        rows: widget.song.map((e) {
          var selected = Provider.of<currentSong>(context).song?.id  == e.id;
          var textStyle = TextStyle(color: selected ? Theme.of(context).accentColor:Theme.of(context).iconTheme.color);
          return DataRow(
              selected: _selected[widget.song.indexOf(e)],
              onSelectChanged: ((bool? selected) {
                // setState(() {
                //   _selected[widget.song.indexOf(e)] = selected!;
                // });
                Provider.of<currentSong>(context , listen: false).selected(e);

              }),
              cells: [
                DataCell(Text(
                  e.title,
                  style: textStyle,
                )),
                DataCell(Text(
                  e.artist,
                  style:textStyle,
                )),
                DataCell(Text(
                  e.album,
                  style: textStyle,
                )),
                DataCell(Text(
                  e.duration,
                  style:textStyle,
                )),
              ]);
        }).toList(),
      ),
    );
  }
}
