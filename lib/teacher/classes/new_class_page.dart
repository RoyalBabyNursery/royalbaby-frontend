import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:royalbabyapp/teacher/classes/add_event.dart';

import 'package:royalbabyapp/teacher/classes/classe_detils.dart';
import 'package:royalbabyapp/teacher/classes/studint_detils.dart';
import 'package:royalbabyapp/teacher/reports/students_report_page.dart';
import 'package:royalbabyapp/widget/text-field.dart';
import '../../theme/colors.dart';
import '../../theme/fonts.dart';
import '../../riverpod_prov.dart';

class Classes extends ConsumerWidget {
  const Classes({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final classes = ref.watch(classProvider);

    return Scaffold(
      backgroundColor: NewColors.alwaysWhite,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            const SizedBox(height: 12),
            Row(
              children: [
                Text('فصولي الدراسية',
                    style: AppFonts.headingH4(color: NewColors.heading)),
                const SizedBox(width: 4),
                Text('(${classes.length})',
                    style: AppFonts.body2(color: NewColors.body)),
              ],
            ),
            const SizedBox(height: 24),
            Expanded(
              child: ListView.separated(
                itemCount: classes.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final cls = classes[index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ClasseDetils(classIndex: index),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: NewColors.primary100,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: LineColors.border),
                      ),
                      child: Row(
                        children: [
                          Image.asset('assets/images/userss.png'),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(cls.name,
                                      style: AppFonts.headingH6(
                                          color: NewColors.heading)),
                                  const SizedBox(width: 4),
                                  Text('(${cls.grade})',
                                      style: AppFonts.body3(
                                          color: NewColors.body)),
                                ],
                              ),
                              const SizedBox(height: 4),
                              Text('${cls.students.length} طلاب',
                                  style: AppFonts.body4(color: NewColors.body)),
                            ],
                          ),
                          const Spacer(),
                          Image.asset('assets/images/Vector.png'),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ClasseDetils extends ConsumerStatefulWidget {
  final int classIndex;
  const ClasseDetils({super.key, required this.classIndex});

  @override
  ConsumerState<ClasseDetils> createState() => _ClasseDetilsState();
}

class _ClasseDetilsState extends ConsumerState<ClasseDetils> {
  final TextEditingController searchController = TextEditingController();
  String searchQuery = '';

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final classData = ref.watch(classProvider)[widget.classIndex];
    final isFromReportsScreen = ref.watch(isFromReportsScreenProvider);

    // Filter students based on search query
    final filteredStudents = classData.students.where((student) {
      return student.name.toLowerCase().contains(searchQuery.toLowerCase());
    }).toList();

    return Scaffold(
      backgroundColor: NewColors.alwaysWhite,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: NewColors.alwaysWhite,
        surfaceTintColor: NewColors.alwaysWhite,
        title: Row(
          children: [
            InkWell(
              onTap: () {
                ref.read(isFromReportsScreenProvider.notifier).state = false;
                Navigator.pop(context);
              },
              child: Container(
                padding: const EdgeInsets.all(6),
                height: MediaQuery.sizeOf(context).width * 0.091,
                width: MediaQuery.sizeOf(context).width * 0.091,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: LineColors.border, width: 1),
                ),
                child: Image.asset(
                  'assets/images/Dropdown Icon.png',
                  height: MediaQuery.sizeOf(context).width * 0.045,
                  width: MediaQuery.sizeOf(context).width * 0.045,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Text(
              '${classData.name} (${classData.grade})',
              style: AppFonts.body2(color: NewColors.supHeading),
            ),
            const Spacer(),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                        AddStudentPage(classIndex: widget.classIndex),
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(6),
                height: MediaQuery.sizeOf(context).width * 0.091,
                width: MediaQuery.sizeOf(context).width * 0.091,
                decoration: BoxDecoration(
                  color: NewColors.primary50,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Image.asset(
                  'assets/images/Add.png',
                  height: MediaQuery.sizeOf(context).width * 0.045,
                  width: MediaQuery.sizeOf(context).width * 0.045,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(width: 8),
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(24),
                    ),
                  ),
                  builder: (context) => const FilterSheet(),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(6),
                height: MediaQuery.sizeOf(context).width * 0.091,
                width: MediaQuery.sizeOf(context).width * 0.091,
                decoration: BoxDecoration(
                  color: NewColors.alwaysWhite,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: LineColors.border,
                    width: 1,
                  ),
                ),
                child: Image.asset(
                  'assets/images/filter.png',
                  height: MediaQuery.sizeOf(context).width * 0.045,
                  width: MediaQuery.sizeOf(context).width * 0.045,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            const SizedBox(height: 16),
            // Search Bar
            TextField(
              controller: searchController,
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
              textDirection: TextDirection.rtl,
              decoration: InputDecoration(
                hintText: 'ابحث باسم الطالب...',
                hintStyle: AppFonts.body2(color: NewColors.placeHolder),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Image.asset('assets/images/search-normal.png'),
                ),
                suffixIcon: searchQuery.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          searchController.clear();
                          setState(() {
                            searchQuery = '';
                          });
                        },
                      )
                    : null,
                filled: true,
                fillColor: NewColors.inputBG,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: LineColors.inputBorder),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: LineColors.border),
                ),
              ),
            ),
            const SizedBox(height: 25),
            Expanded(
              child: ListView.separated(
                itemCount: filteredStudents.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final student = filteredStudents[index];
                  return GestureDetector(
                    onTap: () {
                      // Update the selected student provider
                      ref.read(selectedStudentProvider.notifier).state =
                          student;

                      if (isFromReportsScreen) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const StudentReportsPage(),
                          ),
                        );
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const StudentDetailsPage(),
                          ),
                        );
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: NewColors.primary100,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: LineColors.border),
                      ),
                      child: Row(
                        children: [
                          // Profile image
                          CircleAvatar(
                            radius: 25,
                            backgroundImage:
                                student.profilePic.startsWith('assets')
                                    ? AssetImage(student.profilePic)
                                        as ImageProvider
                                    : FileImage(File(student.profilePic)),
                          ),
                          const SizedBox(width: 10),
                          // Name and age
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                student.name,
                                style:
                                    AppFonts.caption1(color: NewColors.heading),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                '${student.age} سنة',
                                style: AppFonts.body4(color: NewColors.body),
                              ),
                            ],
                          ),
                          const Spacer(),
                          // Optional arrow or icon
                          Image.asset('assets/images/Vector.png'),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AddStudentPage extends ConsumerStatefulWidget {
  final int classIndex;
  const AddStudentPage({super.key, required this.classIndex});

  @override
  ConsumerState<AddStudentPage> createState() => _AddStudentPageState();
}

class _AddStudentPageState extends ConsumerState<AddStudentPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  File? profilePicFile;
  final ImagePicker _picker = ImagePicker();
  DateTime? selectedBirthDate;

  // Show modal sheet to pick image
  void showImagePickerOptions() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) => Padding(
        padding: const EdgeInsets.all(16),
        child: Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('اختيار من المعرض'),
              onTap: () {
                Navigator.pop(context);
                pickImage(ImageSource.gallery);
              },
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('التقاط صورة بالكاميرا'),
              onTap: () {
                Navigator.pop(context);
                pickImage(ImageSource.camera);
              },
            ),
          ],
        ),
      ),
    );
  }

  // Pick image and request permissions
  Future<void> pickImage(ImageSource source) async {
    try {
      if (source == ImageSource.camera) {
        final status = await Permission.camera.request();
        if (!status.isGranted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('يرجى السماح بالوصول للكاميرا')),
          );
          return;
        }
      } else if (source == ImageSource.gallery) {
        final status = await Permission.photos.request();
        if (!status.isGranted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('يرجى السماح بالوصول للمعرض')),
          );
          return;
        }
      }

      final XFile? pickedFile =
          await _picker.pickImage(source: source, imageQuality: 80);

      if (pickedFile != null) {
        setState(() {
          profilePicFile = File(pickedFile.path);
        });
      }
    } catch (e) {
      print("Image picker error: $e");
    }
  }

  void addStudent() {
    if (nameController.text.isEmpty || selectedBirthDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('يرجى إدخال الاسم وتاريخ الميلاد')),
      );
      return;
    }

    final student = Student(
      name: nameController.text,
      dateOfBirth: selectedBirthDate!,
      age: calculateAgeInYears(selectedBirthDate!),
      profilePic: profilePicFile?.path ?? 'assets/images/default.png',
      className: ref.read(classProvider)[widget.classIndex].name,
    );

    ref.read(classProvider.notifier).addStudent(widget.classIndex, student);
    Navigator.pop(context);
  }

  Future<void> pickBirthDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now()
          .subtract(const Duration(days: 365 * 7)), // default 7 years old
      firstDate: DateTime(2000), // min date
      lastDate: DateTime.now(),
      locale: const Locale('ar', 'AE'),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: NewColors.primary500, // header background color
              onPrimary: NewColors.alwaysWhite, // header text color
              onSurface: NewColors.heading, // body text color
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: NewColors.primary500, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      setState(() {
        selectedBirthDate = pickedDate;
        ageController.text = calculateAgeInYears(pickedDate).toString();
      });
    }
  }

  int calculateAgeInYears(DateTime birthDate) {
    final now = DateTime.now();
    int age = now.year - birthDate.year;
    if (now.month < birthDate.month ||
        (now.month == birthDate.month && now.day < birthDate.day)) {
      age--;
    }
    return age;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NewColors.alwaysWhite,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                padding: const EdgeInsets.all(6),
                height: MediaQuery.sizeOf(context).width * 0.091,
                width: MediaQuery.sizeOf(context).width * 0.091,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: LineColors.border,
                    width: 1,
                  ),
                ),
                child: Image.asset(
                  'assets/images/Dropdown Icon.png',
                  height: MediaQuery.sizeOf(context).width * 0.045,
                  width: MediaQuery.sizeOf(context).width * 0.045,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Text(
              'إضافة طالب جديد',
              style: AppFonts.body2(color: NewColors.supHeading),
            ),
          ],
        ),
        backgroundColor: NewColors.alwaysWhite,
        surfaceTintColor: NewColors.alwaysWhite,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // GestureDetector(
            //   onTap: showImagePickerOptions,
            //   child: CircleAvatar(
            //     radius: 50,
            //     backgroundImage: profilePicFile != null
            //         ? FileImage(profilePicFile!)
            //         : const AssetImage('assets/images/default.png')
            //             as ImageProvider,
            //     child: profilePicFile == null
            //         ? const Icon(Icons.camera_alt,
            //             size: 40, color: Colors.white70)
            //         : null,
            //   ),
            // ),
            const SizedBox(height: 16),
            Text(
              'اسم المناسبة',
              style: AppFonts.body2(color: NewColors.label),
            ),
            SizedBox(height: 12),
            CustomTextFieldWidget(
              labelText: 'ادخل اسم المناسبة',
              controller: nameController,
            ),
            SizedBox(height: 12),
            Text(
              'تاريخ المناسبة',
              style: AppFonts.body2(color: NewColors.label),
            ),
            SizedBox(height: 12),
            Container(
              height: MediaQuery.sizeOf(context).height * 0.06,
              decoration: BoxDecoration(
                color: NewColors.inputBG,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: NewColors.inputBorder, width: 1),
              ),
              alignment: Alignment.center,
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: ageController,
                      readOnly: true,
                      onTap: pickBirthDate,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 0,
                        ),
                        hintText: 'اختر تاريخ الميلاد',
                        hintStyle: AppFonts.body2(color: NewColors.placeHolder),
                        border: InputBorder.none,
                        // suffixIcon: Icon(Icons.calendar_today),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: pickBirthDate,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.calendar_today),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 24),
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(24),
                    ),
                  ),
                  builder: (_) => const UploadOptionsSheet(),
                );
              },
              child: Container(
                height: MediaQuery.sizeOf(context).height * 0.191,
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: NewColors.blueBg,
                  border: Border.all(color: LineColors.blueStroke),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 32),
                    Image.asset(
                      'assets/images/Upload Instructions.png',
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'اضغط للتحميل',
                      style: AppFonts.supHeading3(
                        color: NewColors.blue,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'JPG, PNG, MP4, MP3',
                      style: AppFonts.body4(color: NewColors.caption),
                    ),
                  ],
                ),
              ),
            ),
            // TextField(
            //   controller: nameController,
            //   decoration: const InputDecoration(
            //     hintText: 'اسم الطالب',
            //     border: OutlineInputBorder(),
            //   ),
            // ),
            // const SizedBox(height: 16),
            // TextField(
            //   controller: ageController,
            //   keyboardType: TextInputType.number,
            //   decoration: const InputDecoration(
            //     hintText: 'العمر',
            //     border: OutlineInputBorder(),
            //   ),
            // ),
            // const SizedBox(height: 24),

            SizedBox(height: MediaQuery.sizeOf(context).height * 0.065),
            GestureDetector(
              onTap: addStudent,
              child: Container(
                height: MediaQuery.sizeOf(context).height * 0.057,
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                  color: NewColors.primary500,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    'رفع',
                    style: AppFonts.buttonLg(color: NewColors.alwaysWhite),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
