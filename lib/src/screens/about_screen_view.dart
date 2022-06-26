import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:students/src/screens/supports_screen_view.dart';

class AboutScreenView extends StatelessWidget {
  const AboutScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Text('hello'),
            ElevatedButton(
                onPressed: () {
                  //navigating using a defined route
                  Navigator.pushNamed(context, '/supports');

                  //building a route on demand
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (ctx) => SupportersScreenView(),
                  //   ),
                  // );
                },
                child: Text('supporters'))
          ],
        ),
      ),
    );
  }
}
