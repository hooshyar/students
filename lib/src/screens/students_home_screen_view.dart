import 'package:flutter/material.dart';
import 'package:students/mock/mock_data.dart';
import 'package:students/src/models/student_model.dart';
import 'package:students/src/screens/students_details_screen_view.dart';

class StudentHomeScreenView extends StatefulWidget {
  StudentHomeScreenView({Key? key}) : super(key: key);

  @override
  State<StudentHomeScreenView> createState() => _StudentHomeScreenViewState();
}

class _StudentHomeScreenViewState extends State<StudentHomeScreenView> {
  Color _theColor = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // backgroundColor: Colors.red,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
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
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
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
      ),
    );
  }
}
