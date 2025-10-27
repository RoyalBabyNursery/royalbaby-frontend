import 'package:royalbabyapp/model/classe_model1.dart';

class ParentKid {
  final int id;
  final int studentId;
  final String name;
  final String nationality;
  final String civilId;
  final String dateOfBirth;
  final int age;
  final int year;
  final String? gender;
  final int? courseAttached;
  final int? classAttached;
  final int registrationFormAttached;
  final ClassModel? studentClass;

  ParentKid({
    required this.id,
    required this.studentId,
    required this.name,
    required this.nationality,
    required this.civilId,
    required this.dateOfBirth,
    required this.age,
    required this.year,
    this.gender,
    this.courseAttached,
    this.classAttached,
    required this.registrationFormAttached,
    this.studentClass,
  });

  factory ParentKid.fromJson(Map<String, dynamic> json) {
    return ParentKid(
      id: json['id'],
      studentId: json['student_id'],
      name: json['name_of_student'],
      nationality: json['child_nationality'],
      civilId: json['child_civil_id'].toString(),
      dateOfBirth: json['date_of_birth'],
      age: json['age_of_student'],
      year: json['year'],
      gender: json['gender'],
      courseAttached: json['course_attached'],
      classAttached: json['class_attached'],
      registrationFormAttached: json['registration_form_attached'],
      studentClass:
          json['class'] != null ? ClassModel.fromJson(json['class']) : null,
    );
  }
}
