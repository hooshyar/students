import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen(
      {Key? key,
      required this.imageURL,
      required this.studentName,
      required this.gender})
      : super(key: key);

  final String imageURL;
  final String studentName;
  final String gender;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    height: 197,
                    width: 229,
                    //TODO: change it to the image from the main screen
                    child: Image.network(imageURL),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    //TODO: get the name from the main screen
                    child: Text(studentName),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    child: Text('gender: $gender'),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 300,
                    width: 300,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
