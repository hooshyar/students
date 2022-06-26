import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:students/src/models/student_model.dart';
import 'package:students/src/screens/students_details_screen_view.dart';

import '../../mock/mock_data.dart';

class StudentsListScreenView extends StatefulWidget {
  const StudentsListScreenView({Key? key}) : super(key: key);

  @override
  State<StudentsListScreenView> createState() => _StudentsListScreenViewState();
}

class _StudentsListScreenViewState extends State<StudentsListScreenView> {
  Color _theColor = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.red,
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text('about us'),
              onTap: () {
                Navigator.of(context).pushNamed('/about');
              },
            )
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Students list',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: mockData.length,
              itemBuilder: (context, index) {
                List<StudentModel> _students = mockData.map(
                  (element) {
                    return StudentModel.fromMap(element);
                  },
                ).toList();

                return Container(
                  padding: EdgeInsets.all(10),
                  child: Card(
                    child: ListTile(
                      subtitle: Text(index.toString()),
                      leading: Image.network(
                        _students[index].profileImage!,
                        //TODO: handle if null
                      ),
                      title: Text(
                        _students[index].firstName,
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.arrow_right),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => DetailsScreen(
                                student: _students[index],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            height: 115,
            color: _theColor,
            child: TextButton(
              child: Text(
                'change my color',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                setState(() {
                  // if (_theColor == Colors.red) {
                  //   _theColor = Colors.blue;
                  // } else {
                  //   _theColor = Colors.red;
                  // }
                  _theColor == Colors.red
                      ? _theColor = Colors.blue
                      : _theColor = Colors.red;
                });
              },
            ),
          )
        ],
      ),
    );
  }
}
