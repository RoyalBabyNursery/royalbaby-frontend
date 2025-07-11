class ClassModel {
  final int id;
  final String sectionName;
  final String sectionCode;
  final int studentCount;

  ClassModel({
    required this.id,
    required this.sectionName,
    required this.sectionCode,
    required this.studentCount,
  });

  factory ClassModel.fromJson(Map<String, dynamic> json) {
    return ClassModel(
      id: json['id'],
      sectionName: json['section_name'],
      sectionCode: json['section_code'],
      studentCount: json['student_count'],
    );
  }
}
