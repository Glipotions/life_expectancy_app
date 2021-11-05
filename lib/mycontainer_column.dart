import 'package:flutter/material.dart';
import 'package:life_expectancy_app/constant.dart';

class MyContainerColumn extends StatelessWidget {
  final String? yazi;
  final IconData? icon;
  MyContainerColumn({this.yazi = '', this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 50,
          color: Colors.black54,
        ),
        const SizedBox(),
        Text(
          yazi!,
          style: kMetinStili,
        )
      ],
    );
  }
}
