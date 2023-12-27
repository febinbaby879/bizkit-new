import 'package:bizkit/feature/selfie_card/widgets/selfie_screen.dart';
import 'package:flutter/material.dart';

class SelfieScreensList extends StatefulWidget {
  const SelfieScreensList({super.key});

  @override
  State<SelfieScreensList> createState() => _SelfieScreensListState();
}

 List<Widget> screensSelfi = [
  SelfieScreen(),
];

class _SelfieScreensListState extends State<SelfieScreensList> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return screensSelfi.last;
  }
}