import 'package:bizkit/application/commen/const.dart';
import 'package:bizkit/application/presentation/profile_screen/view/widgets/tile_item.dart';
import 'package:flutter/material.dart';

class ConnectionNetworkScreen extends StatelessWidget {
  const ConnectionNetworkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 18,
            color: kwhite,
          ),
        ),
        backgroundColor: knill,
        title: const Text(
          'Connections & Networking',
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            TileItem(text: 'Blocked Connections'),
            TileItem(text: 'Reported Connections'),
            TileItem(text: 'Restricted Connections')
          ],
        ),
      ),
    );
  }
}
