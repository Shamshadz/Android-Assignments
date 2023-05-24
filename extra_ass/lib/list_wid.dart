import 'package:flutter/material.dart';
// import 'package:extra_ass/pages/add2num/add2num.dart';
// import 'package:extra_ass/pages/signal/signal.dart';

class ListWidget extends StatelessWidget {
  final Map<dynamic, dynamic> page;

  const ListWidget({Key? key, required this.page}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return page['page'];
                }));
              },
              leading: Icon(Icons.content_paste_go_sharp),
              title: Text(page['title']),
              trailing: Icon(Icons.arrow_forward),
            ),
          ],
        ),
      ),
    );
  }
}
