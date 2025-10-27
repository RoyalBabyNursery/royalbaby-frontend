// import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:royalbabyapp/model/parent_kid.dart';

// ============================
// Riverpod Providers
// ============================
final selectedKidProvider = StateProvider<ParentKid?>((ref) => null);
final civilIdProvider = StateProvider<String?>((ref) => null);
final selectedStudentProvider = StateProvider<Student?>((ref) => null);

// ============================
// Models
// ============================
class SchoolClass {
  String name;
  String grade;
  List<Student> students;

  SchoolClass({
    required this.name,
    required this.grade,
    required this.students,
  });
}

class Student {
  String name;
  int age;
  String profilePic;
  DateTime dateOfBirth;
  String className;
  String serialNumber;
  List<String> healthConditions;
  List<bool> attendance;
  List<DateTime> attendanceDates;
  String behavior;
  String parentComments;
  String adminNotes;

  Student({
    required this.name,
    required this.age,
    required this.profilePic,
    required this.dateOfBirth,
    required this.className,
    String? serialNumber,
    List<String>? healthConditions,
    List<bool>? attendance,
    List<DateTime>? attendanceDates,
    this.behavior = '',
    this.parentComments = '',
    this.adminNotes = '',
  })  : serialNumber = serialNumber ?? _generateSerial(),
        healthConditions = healthConditions ??
            ['صحة بدنية جيدة', 'لا توجد حساسية', 'التطعيمات محدثة'],
        attendance =
            attendance ?? List.generate(15, (_) => Random().nextBool()),
        attendanceDates = attendanceDates ??
            List.generate(
              15,
              (index) => DateTime.now().subtract(Duration(days: index)),
            );

  static String _generateSerial() {
    const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    return List.generate(8, (index) => chars[Random().nextInt(chars.length)])
        .join();
  }
}

// ============================
// Sample Names
// ============================
final List<List<String>> sampleNames = [
  [
    'فهد العتيبي',
    'عبدالله المطيري',
    'سارة العنزي',
    'ريم الحربي',
    'محمد الدوسري',
    'جنى الرشيدي',
    'تركي الشمري',
    'ليان السبيعي',
    'ناصر العازمي',
    'دانة الفهد'
  ],
  [
    'أحمد المطيري',
    'نورة العجمي',
    'سلمان الخالدي',
    'هند الشمري',
    'فيصل العازمي',
    'جود الحربي',
    'بدر الدوسري',
    'رغد السهلي',
    'مها العتيبي',
    'عمر العنزي'
  ],
  [
    'سيف المطيري',
    'ليان الدوسري',
    'عبدالرحمن العتيبي',
    'نور الشمري',
    'رائد العازمي',
    'سارة الحربي',
    'مشعل الخالدي',
    'جنى العنزي',
    'أماني الفهد',
    'تركي الرشيدي'
  ],
  [
    'فيصل المطيري',
    'مها الحربي',
    'سلمان العتيبي',
    'جود العنزي',
    'عبدالله الدوسري',
    'ريم العازمي',
    'تركي السبيعي',
    'ليان الشمري',
    'فهد الفهد',
    'رغد الرشيدي'
  ],
  [
    'نايف المطيري',
    'أسماء الحربي',
    'سعود العتيبي',
    'نورة الدوسري',
    'ريان العنزي',
    'جنى الشمري',
    'عبدالعزيز الفهد',
    'ليان السبيعي',
    'مها العازمي',
    'فيصل الرشيدي'
  ],
];

// ============================
// ClassNotifier with Students
// ============================
class ClassNotifier extends StateNotifier<List<SchoolClass>> {
  ClassNotifier() : super(_generateClasses());

  static List<SchoolClass> _generateClasses() {
    final classNames = ['الاكتشاف', 'الإبداع', 'التميز', 'النجاح', 'التفوق'];
    final grades = ['G1', 'G2', 'G3', 'G4', 'G5'];

    List<SchoolClass> classes = [];

    for (int i = 0; i < 5; i++) {
      final studentNames = sampleNames[i];
      studentNames.shuffle(); // randomize order
      final numStudents = 5 + (i % 6); // 5–10 students

      final students = List.generate(numStudents, (index) {
        final birthYear =
            DateTime.now().year - (5 + (index % 5)); // same as age
        final birthMonth = Random().nextInt(12) + 1;
        final birthDay = Random().nextInt(28) + 1;

        return Student(
          name: studentNames[index],
          age: 5 + (index % 5),
          profilePic: 'assets/images/IMAGE (5).png',
          dateOfBirth: DateTime(birthYear, birthMonth, birthDay),
          className: classNames[i],
        );
      });

      classes.add(SchoolClass(
        name: classNames[i],
        grade: grades[i],
        students: students,
      ));
    }

    return classes;
  }

  void addStudent(int classIndex, Student student) {
    state[classIndex].students.add(student);
    state = [...state]; // trigger UI update
  }
}

// ============================
// Riverpod Provider
// ============================
final classProvider =
    StateNotifierProvider<ClassNotifier, List<SchoolClass>>((ref) {
  return ClassNotifier();
});

// ============================
// Attendance Row Widget
// ============================
class AttendanceList extends StatelessWidget {
  final Student student;
  const AttendanceList({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(student.attendance.length, (index) {
        final date = student.attendanceDates[index];
        final isPresent = student.attendance[index];

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Status on left
              Text(
                isPresent ? 'حاضر' : 'غائب',
                style: TextStyle(
                  color: isPresent ? Colors.green : Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // Date on right
              Text(
                '${date.day}/${date.month}/${date.year}',
                style: const TextStyle(color: Colors.black87),
              ),
            ],
          ),
        );
      }),
    );
  }
}

enum ReportFilter { daily, weekly, monthly }

final reportFilterProvider =
    StateProvider<ReportFilter>((ref) => ReportFilter.daily);

final isFromReportsScreenProvider = StateProvider<bool>((ref) => false);
// Riverpod provider to hold the attendance selection
final attendanceProvider = StateProvider<bool?>((ref) => null);
final attendanceChoiceProvider = StateProvider<String?>((ref) => null);

final studentReportProvider = StateProvider<Map<int, String>>((ref) => {});

// // ============================
// // Sample Questions
// // ============================
// final List<String> sampleQuestions = [
//   'متى نام الطفل للمرة الأولى؟',
//   'متى استيقظ الطفل للمرة الأولى؟',
//   'متى نام الطفل للمرة الثانية؟',
//   'متى استيقظ الطفل للمرة الثانية؟',
//   'متى نام الطفل للمرة الثالثة؟',
//   'متى استيقظ الطفل للمرة الثالثة؟',
//   'متى شرب الطفل الحليب للمرة الأولى؟',
//   'كمية الحليب التي شربها (بالمليلتر)؟',
//   'متى شرب الطفل الحليب للمرة الثانية؟',
//   'كمية الحليب التي شربها (بالمليلتر)؟',
//   'متى شرب الطفل الحليب للمرة الثالثة؟',
//   'كمية الحليب التي شربها (بالمليلتر)؟',
//   'متى أكل الطفل لأول مرة؟',
//   'متى أكل الطفل للمرة الثانية؟',
//   'متى أكل الطفل للمرة الثالثة؟',
//   'ما نوع الإخراج لأول مرة؟',
//   'متى تم تغيير الحفاض لأول مرة؟',
//   'ما نوع الإخراج للمرة الثانية؟',
//   'متى تم تغيير الحفاض للمرة الثانية؟',
//   'ما نوع الإخراج للمرة الثالثة؟',
//   'متى تم تغيير الحفاض للمرة الثالثة؟',
//   'هل لديك ملاحظات إضافية عن الطفل اليوم؟',
// ];

// ============================
// Question Model
// ============================
enum QuestionType { text, time, radio }

class ReportQuestion {
  final String question;
  final QuestionType type;
  final List<String>? options; // for radio button choices

  ReportQuestion({
    required this.question,
    required this.type,
    this.options,
  });
}

// ============================
// Questions List with Types
// ============================
final List<ReportQuestion> sampleQuestions = [
  ReportQuestion(
      question: 'متى نام الطفل للمرة الأولى؟', type: QuestionType.time),
  ReportQuestion(
      question: 'متى استيقظ الطفل للمرة الأولى؟', type: QuestionType.time),
  ReportQuestion(
      question: 'متى نام الطفل للمرة الثانية؟', type: QuestionType.time),
  ReportQuestion(
      question: 'متى استيقظ الطفل للمرة الثانية؟', type: QuestionType.time),
  ReportQuestion(
      question: 'متى نام الطفل للمرة الثالثة؟', type: QuestionType.time),
  ReportQuestion(
      question: 'متى استيقظ الطفل للمرة الثالثة؟', type: QuestionType.time),
  ReportQuestion(
      question: 'متى شرب الطفل الحليب للمرة الأولى؟', type: QuestionType.time),
  ReportQuestion(
      question: 'كمية الحليب التي شربها (بالمليلتر)؟', type: QuestionType.text),
  ReportQuestion(
      question: 'متى شرب الطفل الحليب للمرة الثانية؟', type: QuestionType.time),
  ReportQuestion(
      question: 'كمية الحليب التي شربها (بالمليلتر)؟', type: QuestionType.text),
  ReportQuestion(
      question: 'متى شرب الطفل الحليب للمرة الثالثة؟', type: QuestionType.time),
  ReportQuestion(
      question: 'كمية الحليب التي شربها (بالمليلتر)؟', type: QuestionType.text),
  ReportQuestion(question: 'متى أكل الطفل لأول مرة؟', type: QuestionType.time),
  ReportQuestion(
      question: 'متى أكل الطفل للمرة الثانية؟', type: QuestionType.time),
  ReportQuestion(
      question: 'متى أكل الطفل للمرة الثالثة؟', type: QuestionType.time),
  ReportQuestion(
      question: 'ما نوع الإخراج لأول مرة؟',
      type: QuestionType.radio,
      options: ['نعم', 'لا']),
  ReportQuestion(
      question: 'متى تم تغيير الحفاض لأول مرة؟', type: QuestionType.time),
  ReportQuestion(
      question: 'ما نوع الإخراج للمرة الثانية؟',
      type: QuestionType.radio,
      options: ['نعم', 'لا']),
  ReportQuestion(
      question: 'متى تم تغيير الحفاض للمرة الثانية؟', type: QuestionType.time),
  ReportQuestion(
      question: 'ما نوع الإخراج للمرة الثالثة؟',
      type: QuestionType.radio,
      options: ['نعم', 'لا']),
  ReportQuestion(
      question: 'متى تم تغيير الحفاض للمرة الثالثة؟', type: QuestionType.time),
  ReportQuestion(
      question: 'هل لديك ملاحظات إضافية عن الطفل اليوم؟',
      type: QuestionType.text),
];
