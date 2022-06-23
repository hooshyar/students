import 'package:flutter/material.dart';
import 'package:students/mock/mock_data.dart';
import 'package:students/src/screens/students_details_screen_view.dart';

class StudentHomeScreenView extends StatelessWidget {
  const StudentHomeScreenView({Key? key}) : super(key: key);

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
                  return Container(
                    padding: EdgeInsets.all(10),
                    child: Card(
                      child: ListTile(
                        subtitle: Text(index.toString()),
                        leading: Image.network(
                          mockData[index]["profileImage"].toString(),
                        ),
                        title: Text(
                          mockData[index]["first_name"].toString(),
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.arrow_right),
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => DetailsScreen(
                                  imageURL: mockData[index]["profileImage"]
                                      .toString(),
                                  studentName:
                                      mockData[index]["first_name"].toString(),
                                  gender: mockData[index]["gender"].toString(),
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
              //was for hello
              height: 115,
              color: Colors.blue,
            )
          ],
        ),
      ),
    );
  }
}
