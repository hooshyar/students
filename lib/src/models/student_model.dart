import 'dart:convert';

class StudentModel {
  final int id;
  final String firstName;
  final String last_name;
  String? email;
  String? gender;
  String? profileImage;
  StudentModel({
    required this.id,
    required this.firstName,
    required this.last_name,
    this.email,
    this.gender,
    this.profileImage,
  });

  //To update a field or multiple properties of our object we can use copy with
  StudentModel copyWith({
    int? id,
    String? firstName,
    String? last_name,
    String? email,
    String? gender,
    String? profileImage,
  }) {
    return StudentModel(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      last_name: last_name ?? this.last_name,
      email: email ?? this.email,
      gender: gender ?? this.gender,
      profileImage: profileImage ?? this.profileImage,
    );
  }

  //to convert an object to map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'firstName': firstName,
      'last_name': last_name,
      'email': email,
      'gender': gender,
      'profileImage': profileImage,
    };
  }

// to create an object from map data
  factory StudentModel.fromMap(Map<String, dynamic> map) {
    return StudentModel(
      id: map['id']?.toInt() ?? 0,
      firstName: map['firstName'] ?? '',
      last_name: map['last_name'] ?? '',
      email: map['email'],
      gender: map['gender'],
      profileImage: map['profileImage'],
    );
  }

  //if you want to convert your object to json you should use this method
  String toJson() => json.encode(toMap());

  //the data you want to read from an API is of type of json most of the times
  // to read it from json we use this named constructor
  factory StudentModel.fromJson(String source) =>
      StudentModel.fromMap(json.decode(source));
}
