import 'package:flutter/cupertino.dart';

class Company {
  Company({
    //it is required parameterfor the class to work as expected
    @required this.name,
    @required this.location,
    @required this.backdropPhoto,
    @required this.logo,
    @required this.about,
    @required this.courses,
  });
  final String name, location, backdropPhoto, logo, about;
  final List<Course> courses;
}

class Course {
  Course({@required this.title, @required this.thumbnail, @required this.url});
  final String title, thumbnail, url;
}
