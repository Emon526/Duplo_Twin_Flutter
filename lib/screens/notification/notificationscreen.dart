import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        // body: Timeline.tileBuilder(
        //   builder: TimelineTileBuilder.fromStyle(
        //     contentsAlign: ContentsAlign.alternating,
        //     contentsBuilder: (context, index) => Padding(
        //       padding: const EdgeInsets.all(24.0),
        //       child: Text('Timeline Event $index'),
        //     ),
        //     itemCount: 10,
        //   ),
        // ),
        );
  }
}
