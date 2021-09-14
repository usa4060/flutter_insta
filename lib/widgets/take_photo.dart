import 'package:flutter/material.dart';
import 'package:insta/constants/common_size.dart';
import 'package:insta/constants/screen_size.dart';

class TakePhoto extends StatelessWidget {
  const TakePhoto({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.black,
          width: size.width,
          height: size.width,
        ),
        Expanded(
            child: Container(
          width: 100,
          height: 100,
          child: OutlinedButton(
              onPressed: () {},
              child: Text(""),
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.black12,
                side: BorderSide(color: Colors.black26, width: 5),
                shape: CircleBorder(),
              )),
        ))
      ],
    );
  }
}
