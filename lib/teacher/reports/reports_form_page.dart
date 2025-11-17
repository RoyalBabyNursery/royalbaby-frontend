import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:royalbabyapp/riverpod_prov.dart';
import 'package:royalbabyapp/theme/colors.dart';
import 'package:royalbabyapp/theme/fonts.dart';

class StudentReportFormPage extends ConsumerStatefulWidget {
  const StudentReportFormPage({super.key});

  @override
  ConsumerState<StudentReportFormPage> createState() =>
      _StudentReportFormPageState();
}

class _StudentReportFormPageState extends ConsumerState<StudentReportFormPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final student = ref.watch(selectedStudentProvider);
    final answers = ref.watch(studentReportProvider);

    if (student == null) {
      return Scaffold(
        body: Center(child: Text('لم يتم اختيار الطالب بعد')),
      );
    }

    // Split questions into pages (3–4 per page)
    final pages = [
      sampleQuestions.sublist(0, 6),
      sampleQuestions.sublist(6, 12),
      sampleQuestions.sublist(12, 15),
      sampleQuestions.sublist(15, 21),
      sampleQuestions.sublist(21, sampleQuestions.length),
    ];

    return Scaffold(
      backgroundColor: NewColors.alwaysWhite,
      // appBar: AppBar(
      //   backgroundColor: NewColors.alwaysWhite,
      //   surfaceTintColor: NewColors.alwaysWhite,
      //   automaticallyImplyLeading: false,
      //   title: Row(
      //     children: [
      //       InkWell(
      //         onTap: () {
      //           Navigator.pop(context);
      //         },
      //         child: Container(
      //           padding: const EdgeInsets.all(6),
      //           height: MediaQuery.sizeOf(context).width * 0.091,
      //           width: MediaQuery.sizeOf(context).width * 0.091,
      //           decoration: BoxDecoration(
      //             borderRadius: BorderRadius.circular(8),
      //             border: Border.all(color: LineColors.border, width: 1),
      //           ),
      //           child: Image.asset(
      //             'assets/images/Dropdown Icon.png',
      //             height: MediaQuery.sizeOf(context).width * 0.045,
      //             width: MediaQuery.sizeOf(context).width * 0.045,
      //             fit: BoxFit.contain,
      //           ),
      //         ),
      //       ),
      //       const SizedBox(width: 10),
      //       // Add this right before the Row of buttons:
      //       Column(
      //         children: [
      //           // Circular progress indicator
      //           SizedBox(
      //             height: 100,
      //             width: 100,
      //             child: Stack(
      //               alignment: Alignment.center,
      //               children: [
      //                 Transform.scale(
      //                   scale:
      //                       1.6, // 👈 increase this to make the circle truly larger
      //                   child: CircularProgressIndicator(
      //                     value: (_currentPage + 1) / pages.length,
      //                     strokeWidth: 6,
      //                     backgroundColor: NewColors.greenBG,
      //                     color: NewColors.green,
      //                   ),
      //                 ),
      //                 Text(
      //                   '${_currentPage + 1}/${pages.length}',
      //                   style: AppFonts.body1(color: NewColors.green),
      //                 ),
      //               ],
      //             ),
      //           ),

      //           const SizedBox(height: 8),
      //         ],
      //       ),

      //       Text(
      //         'تقييم الطالب: ${student.name}',
      //         style: AppFonts.headingH4(color: NewColors.heading),
      //       ),
      //     ],
      //   ),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            const SizedBox(height: 25),
            Row(
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
                // Add this right before the Row of buttons:
                Column(
                  children: [
                    // Circular progress indicator
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Transform.scale(
                            scale:
                                1.6, // 👈 increase this to make the circle truly larger
                            child: CircularProgressIndicator(
                              value: (_currentPage + 1) / pages.length,
                              strokeWidth: 4,
                              strokeCap: StrokeCap.round,
                              backgroundColor: NewColors.greenBG,
                              color: NewColors.green,
                            ),
                          ),
                          Text(
                            '${_currentPage + 1}/${pages.length}',
                            style: AppFonts.body1(color: NewColors.green),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 8),
                  ],
                ),

                Text(
                  'تقييم الطالب: ${student.name}',
                  style: AppFonts.headingH4(color: NewColors.heading),
                ),
              ],
            ),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: pages.length,
                itemBuilder: (context, pageIndex) {
                  final questions = pages[pageIndex];
                  return ListView.builder(
                    itemCount: questions.length,
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      final questionIndex = pageIndex * 6 + index;
                      final question = questions[index];

                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${questionIndex + 1}. ${question.question}',
                              style: AppFonts.body1(color: NewColors.body),
                            ),
                            const SizedBox(height: 8),
                            Builder(builder: (context) {
                              final answer = answers[questionIndex] ?? '';

                              switch (question.type) {
                                case QuestionType.text:
                                  return Container(
                                    height: MediaQuery.sizeOf(context).height *
                                        0.06,
                                    decoration: BoxDecoration(
                                      color: NewColors.inputBG,
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                          color: NewColors.inputBorder,
                                          width: 1),
                                    ),
                                    child: TextField(
                                      decoration: InputDecoration(
                                        hintText: 'أدخل الإجابة هنا...',
                                        border: InputBorder.none,
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                horizontal: 12, vertical: 8),
                                      ),
                                      onChanged: (value) {
                                        final newAnswers =
                                            Map<int, String>.from(answers);
                                        newAnswers[questionIndex] = value;
                                        ref
                                            .read(
                                                studentReportProvider.notifier)
                                            .state = newAnswers;
                                      },
                                      controller:
                                          TextEditingController(text: answer),
                                    ),
                                  );

                                case QuestionType.time:
                                  return Container(
                                    height: MediaQuery.sizeOf(context).height *
                                        0.06,
                                    decoration: BoxDecoration(
                                      color: NewColors.inputBG,
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                          color: NewColors.inputBorder,
                                          width: 1),
                                    ),
                                    child: TextField(
                                      readOnly: true,
                                      controller:
                                          TextEditingController(text: answer),
                                      decoration: InputDecoration(
                                        hintText: 'اختر الوقت',
                                        border: InputBorder.none,
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                horizontal: 12, vertical: 8),
                                        suffixIcon:
                                            const Icon(Icons.access_time),
                                      ),
                                      onTap: () async {
                                        final now = TimeOfDay.now();
                                        final selectedTime =
                                            await showTimePicker(
                                          context: context,
                                          initialTime: answer.isNotEmpty
                                              ? TimeOfDay(
                                                  hour: int.parse(
                                                      answer.split(':')[0]),
                                                  minute: int.parse(
                                                      answer.split(':')[1]),
                                                )
                                              : now,
                                          builder: (context, child) {
                                            return Theme(
                                              data: Theme.of(context).copyWith(
                                                colorScheme: ColorScheme.light(
                                                  primary: NewColors
                                                      .primary500, // ✅ main accent color (dial hand, buttons)
                                                  onPrimary: Colors
                                                      .white, // ✅ text color on top of primary color
                                                  surface: NewColors
                                                      .alwaysWhite, // ✅ background of the dialog
                                                  onSurface: NewColors
                                                      .black, // ✅ color of the numbers/text
                                                ),
                                                textButtonTheme:
                                                    TextButtonThemeData(
                                                  style: TextButton.styleFrom(
                                                    foregroundColor: NewColors
                                                        .blue, // ✅ “OK” and “CANCEL” buttons
                                                  ),
                                                ),
                                              ),
                                              child: child!,
                                            );
                                          },
                                        );

                                        if (selectedTime != null) {
                                          final newAnswers =
                                              Map<int, String>.from(answers);
                                          newAnswers[questionIndex] =
                                              '${selectedTime.hour.toString().padLeft(2, '0')}:${selectedTime.minute.toString().padLeft(2, '0')}';
                                          ref
                                              .read(studentReportProvider
                                                  .notifier)
                                              .state = newAnswers;
                                        }
                                      },
                                    ),
                                  );

                                case QuestionType.radio:
                                  return Wrap(
                                    spacing: 12,
                                    children: question.options!
                                        .map((option) => ChoiceChip(
                                              label: Text(option),
                                              selected: answer == option,
                                              onSelected: (_) {
                                                final newAnswers =
                                                    Map<int, String>.from(
                                                        answers);
                                                newAnswers[questionIndex] =
                                                    option;
                                                ref
                                                    .read(studentReportProvider
                                                        .notifier)
                                                    .state = newAnswers;
                                              },
                                              selectedColor:
                                                  NewColors.primary500,
                                              backgroundColor:
                                                  NewColors.alwaysWhite,
                                              labelStyle: TextStyle(
                                                color: answer == option
                                                    ? Colors.white
                                                    : NewColors.primary500,
                                              ),
                                            ))
                                        .toList(),
                                  );

                                default:
                                  return const SizedBox.shrink();
                              }
                            }),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                if (_currentPage < pages.length - 1)
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        _pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut);
                        setState(() => _currentPage++);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: NewColors.primary500,
                        minimumSize: const Size(double.infinity, 50),
                      ),
                      child: Text(
                        'التالي',
                        style: AppFonts.buttonLg(color: NewColors.alwaysWhite),
                      ),
                    ),
                  ),
                if (_currentPage == pages.length - 1)
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        print('Save button pressed. Answers: $answers');
                        if (answers.isEmpty) {
                          print('No answers provided');
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content:
                                    Text('الرجاء إدخال إجابة واحدة على الأقل')),
                          );
                          return;
                        }

                        // Save answers to student
                        student.parentComments = '';
                        answers.forEach((index, value) {
                          if (index < sampleQuestions.length) {
                            student.parentComments +=
                                '${index + 1}. ${sampleQuestions[index].question}: $value\n';
                          }
                        });

                        // Navigate to details page
                        try {
                          print('Navigating to StudentReportDetailsPage');
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => StudentReportDetailsPage(
                                  student: student,
                                  answers: Map<int, String>.from(answers)),
                            ),
                          );
                        } catch (e) {
                          print('Navigation error: $e');
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Error navigating: $e')),
                          );
                        }

                        // Clear provider after saving
                        ref.read(studentReportProvider.notifier).state = {};
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: NewColors.primary500,
                        minimumSize: const Size(double.infinity, 50),
                      ),
                      child: Text(
                        'حفظ التقرير',
                        style: AppFonts.buttonLg(color: NewColors.alwaysWhite),
                      ),
                    ),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class StudentReportDetailsPage extends StatelessWidget {
  final Student student;
  final Map<int, String> answers;

  const StudentReportDetailsPage({
    super.key,
    required this.student,
    required this.answers,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NewColors.alwaysWhite,
      appBar: AppBar(
        backgroundColor: NewColors.alwaysWhite,
        title: Text(
          'تفاصيل تقرير الطالب',
          style: AppFonts.headingH4(color: NewColors.heading),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Student Details
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(student.profilePic),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(student.name,
                        style: AppFonts.headingH5(color: NewColors.heading)),
                    Text('العمر: ${student.age}',
                        style: AppFonts.body2(color: NewColors.body)),
                    Text('الفصل: ${student.className}',
                        style: AppFonts.body2(color: NewColors.body)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: sampleQuestions.length,
                itemBuilder: (context, index) {
                  final question = sampleQuestions[index];
                  final answer = answers[index] ?? 'لم يتم إدخال إجابة';
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${index + 1}. ${question.question}',
                          style: AppFonts.body1(color: NewColors.body),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'الإجابة: $answer',
                          style: AppFonts.body2(color: NewColors.primary500),
                        ),
                      ],
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
