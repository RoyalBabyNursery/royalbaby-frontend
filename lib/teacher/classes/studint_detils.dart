// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:royalbabyapp/theme/colors.dart';
// import 'package:royalbabyapp/widget/container.dart';
// import 'package:royalbabyapp/widget/text-field.dart';

// import '../../theme/fonts.dart';

// class StudentDetails extends StatefulWidget {
//   const StudentDetails({super.key});

//   @override
//   State<StudentDetils> createState() => _TeacherDetilsState();
// }

// class _TeacherDetilsState extends State<StudentDetils> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: NewColors.alwaysWhite,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(12.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   children: [
//                     InkWell(
//                       onTap: () {
//                         Navigator.pop(context);
//                       },
//                       child: Container(
//                         padding: const EdgeInsets.all(6),
//                         height: MediaQuery.sizeOf(context).width * 0.091,
//                         width: MediaQuery.sizeOf(context).width * 0.091,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(8),
//                           border: Border.all(
//                             color: LineColors.border,
//                             width: 1,
//                           ),
//                         ),
//                         child: Image.asset(
//                           'assets/images/Dropdown Icon.png',
//                           height: MediaQuery.sizeOf(context).width * 0.045,
//                           width: MediaQuery.sizeOf(context).width * 0.045,
//                           fit: BoxFit.contain,
//                         ),
//                       ),
//                     ),
//                     const SizedBox(width: 10),
//                     Text(
//                       'صفحة الطالب',
//                       style: AppFonts.body2(color: NewColors.supHeading),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 24),
//                 Container(
//                   height: MediaQuery.sizeOf(context).height * 0.104,
//                   width: MediaQuery.sizeOf(context).width,
//                   decoration: BoxDecoration(
//                     color: NewColors.grayBox,
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.all(12.0),
//                     child: Row(
//                       children: [
//                         Container(
//                           height: MediaQuery.sizeOf(context).width * 0.116,
//                           width: MediaQuery.sizeOf(context).width * 0.116,
//                           decoration: BoxDecoration(
//                             color: NewColors.bg,
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                           child: Image.asset('assets/images/user1.png'),
//                         ),
//                         SizedBox(width: 12),
//                         Padding(
//                           padding: const EdgeInsets.only(top: 8.0, right: 5),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 'آدم محمود علي',
//                                 style: AppFonts.supHeading3(
//                                   color: NewColors.supHeading,
//                                 ),
//                               ),
//                               SizedBox(height: 3),
//                               Text(
//                                 'ذكر',
//                                 style: AppFonts.body3(color: NewColors.caption),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 24),
//                 Text(
//                   'البيانات الأساسية',
//                   style: AppFonts.supHeading3(color: NewColors.supHeading),
//                 ),
//                 SizedBox(height: 12),
//                 InfoRow(
//                   label: 'تاريخ الميلاد',
//                   value: '١٥ مارس ٢٠٢٠',
//                   valueColor: NewColors.supHeading,
//                 ),
//                 SizedBox(height: 12),
//                 InfoRow(
//                   label: 'العمر',
//                   value: '٤ سنوات و٢ شهر',
//                   valueColor: NewColors.supHeading,
//                 ),
//                 SizedBox(height: 12),
//                 InfoRow(
//                   label: 'فصله الدراسي',
//                   value: 'الاكتشاف',
//                   valueColor: NewColors.supHeading,
//                 ),
//                 SizedBox(height: 12),
//                 InfoRow(
//                   label: 'الرقم التسلسلي',
//                   value: 'RB-202045',
//                   valueColor: NewColors.supHeading,
//                 ),
//                 SizedBox(height: 24),
//                 Divider(height: 1, color: LineColors.line),
//                 SizedBox(height: 24),
//                 Text(
//                   'الحالة الصحية',
//                   style: AppFonts.supHeading3(color: NewColors.supHeading),
//                 ),
//                 SizedBox(height: 12),
//                 InfoText(label: 'حساسية خفيفة من الحليب'),
//                 SizedBox(height: 12),
//                 InfoText(label: 'تم تسليم تقرير طبي موثق'),
//                 SizedBox(height: 12),
//                 InfoText(
//                   label:
//                       'ملاحظة من الإدارة: لا يُفضل تقديم منتجات ألبان بدون إشراف',
//                 ),
//                 SizedBox(height: 24),
//                 Divider(height: 1, color: LineColors.line),
//                 SizedBox(height: 24),
//                 Text(
//                   'سجل الحضور',
//                   style: AppFonts.supHeading3(color: NewColors.supHeading),
//                 ),
//                 SizedBox(height: 12),
//                 InfoRow(
//                   label: '١٧ مايو',
//                   value: 'حاضر',
//                   valueColor: NewColors.green,
//                 ),
//                 SizedBox(height: 12),
//                 InfoRow(
//                   label: '١٦ مايو',
//                   value: 'حاضر',
//                   valueColor: NewColors.green,
//                 ),
//                 SizedBox(height: 12),
//                 InfoRow(
//                   label: '١٥ مايو',
//                   value: 'غائب (سبب صحي)',
//                   valueColor: NewColors.red,
//                 ),
//                 SizedBox(height: 12),
//                 InfoRow(
//                   label: '١٤ مايو',
//                   value: 'حاضر',
//                   valueColor: NewColors.green,
//                 ),
//                 SizedBox(height: 24),
//                 Divider(height: 1, color: LineColors.line),
//                 SizedBox(height: 24),
//                 Text(
//                   'السلوك والتفاعل',
//                   style: AppFonts.supHeading3(color: NewColors.supHeading),
//                 ),
//                 SizedBox(height: 12),
//                 InfoText(label: '١٧ مايو: هادئ ومتفاعل مع النشاط الفني'),
//                 SizedBox(height: 12),
//                 InfoText(label: '١٥ مايو: لم يحضر'),
//                 SizedBox(height: 12),
//                 InfoText(label: '١٤ مايو: ساعد زملاءه في الترتيب'),
//                 SizedBox(height: 12),
//                 InfoText(
//                   label:
//                       'ملاحظات خاصة: يظهر انزعاجًا طفيفًا في وقت النوم، تمت متابعته',
//                 ),
//                 SizedBox(height: 24),
//                 Divider(height: 1, color: LineColors.line),
//                 SizedBox(height: 24),
//                 TeacherNoteCard(
//                   title: 'تعليقات ولي الأمر',
//                   note:
//                       '•   ١٢ مايو: هل من الممكن التذكير بزجاجة الماء يوميًا؟',
//                 ),
//                 SizedBox(height: 24),
//                 Divider(height: 1, color: LineColors.line),
//                 SizedBox(height: 24),
//                 Container(
//                   width: MediaQuery.sizeOf(context).width,
//                   padding: const EdgeInsets.all(12),
//                   decoration: BoxDecoration(
//                     color: NewColors.lightBG.withOpacity(0.3),
//                     borderRadius: BorderRadius.circular(12),
//                     border: Border.all(color: LineColors.border),
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'ملاحظات إدارية',
//                         style: AppFonts.supHeading3(
//                           color: NewColors.supHeading,
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               '•  لا توجد ملاحظات حرجة)',
//                               style: AppFonts.body3(color: NewColors.body),
//                             ),
//                             SizedBox(height: 8),
//                             Text(
//                               '•  تم تأكيد تحديث الملف الصحي من ولي الأمر',
//                               style: AppFonts.body3(color: NewColors.body),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:royalbabyapp/riverpod_prov.dart';
import '../../theme/colors.dart';
import '../../theme/fonts.dart';

class StudentDetailsPage extends ConsumerWidget {
  const StudentDetailsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final student = ref.watch(selectedStudentProvider);

    if (student == null) {
      return Scaffold(
        body: Center(child: Text('No student selected')),
      );
    }

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
              student.name,
              style: AppFonts.body2(color: NewColors.supHeading),
            ),
          ],
        ),
        // Text(student.name, style: AppFonts.body2(color: NewColors.heading)),
        // leading: BackButton(color: NewColors.heading),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.sizeOf(context).height * 0.104,
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                color: NewColors.grayBox,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    Container(
                      height: MediaQuery.sizeOf(context).width * 0.116,
                      width: MediaQuery.sizeOf(context).width * 0.116,
                      decoration: BoxDecoration(
                        color: NewColors.bg,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Image.asset(student.profilePic),
                    ),
                    SizedBox(width: 12),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, right: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            student.name,
                            style: AppFonts.supHeading3(
                              color: NewColors.supHeading,
                            ),
                          ),
                          SizedBox(height: 3),
                          Text(
                            'ذكر',
                            style: AppFonts.body3(color: NewColors.caption),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Profile
            SizedBox(height: 24),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'فصله الدراسي:',
                      style: AppFonts.body3(color: NewColors.body),
                    ),
                    Text(student.className,
                        style: AppFonts.body2(color: NewColors.black)),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'العمر:',
                      style: AppFonts.body3(color: NewColors.body),
                    ),
                    Text(student.age.toString(),
                        style: AppFonts.body2(color: NewColors.black)),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'تاريخ الميلاد:',
                      style: AppFonts.body3(color: NewColors.body),
                    ),
                    Text(
                      student.dateOfBirth.toString().split(' ')[0],
                      style: AppFonts.body2(color: NewColors.black),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'الرقم التسلسلي',
                      style: AppFonts.body3(color: NewColors.body),
                    ),
                    Text(student.serialNumber,
                        style: AppFonts.body2(color: NewColors.black)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24),
            Divider(
              color: NewColors.inputBorder,
            ),
            // Health conditions
            const SizedBox(height: 24),
            Text(
              'الحالة الصحية',
              style: AppFonts.supHeading3(color: NewColors.supHeading),
            ),
            const SizedBox(height: 8),
            ...student.healthConditions.map((condition) => Row(
                  children: [
                    const Icon(Icons.circle, size: 8),
                    const SizedBox(width: 8),
                    Text(condition,
                        style: AppFonts.body2(color: NewColors.body)),
                  ],
                )),
            const SizedBox(height: 24),

            Divider(
              color: NewColors.inputBorder,
            ),

            const SizedBox(height: 24),
            // Attendance
            Text('سجل الحضور',
                style: AppFonts.headingH6(color: NewColors.heading)),

            // Wrap(
            //   spacing: 8,
            //   children: List.generate(student.attendance.length, (index) {
            //     return Chip(
            //       label: Text('Day ${index + 1}'),
            //       backgroundColor: student.attendance[index]
            //           ? Colors.green[300]
            //           : Colors.red[300],
            //     );
            //   }),
            // ),
            const SizedBox(height: 15),
            Column(
              children: List.generate(student.attendance.length, (index) {
                final attendanceDate =
                    student.attendanceDates[index]; // List<DateTime>
                final isPresent = student.attendance[index]; // true/false

                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Status on the left
                      Text('${attendanceDate.day}/${attendanceDate.month}',
                          style: AppFonts.headingH6(color: NewColors.body)),
                      Text(
                        isPresent ? 'حاضر' : 'غائب',
                        style: isPresent
                            ? AppFonts.headingH6(color: NewColors.green)
                            : AppFonts.headingH6(color: NewColors.red),
                        // TextStyle(
                        //   color: isPresent ? NewColors.green : Colors.red,
                        //   fontWeight: FontWeight.bold,
                        // ),
                      ),

                      // Date on the right (formatted)
                    ],
                  ),
                );
              }),
            ),
            const SizedBox(height: 24),

            Divider(
              color: NewColors.inputBorder,
            ),

            const SizedBox(height: 24),
            // Behavior & interactions
            Text(
              'السلوك والتفاعل',
              style: AppFonts.supHeading3(color: NewColors.supHeading),
            ),
            const SizedBox(height: 8),

            Text(student.behavior.isEmpty ? 'لا توجد تفاصيل' : student.behavior,
                style: AppFonts.body2(color: NewColors.body)),
            const SizedBox(height: 24),

            Divider(
              color: NewColors.inputBorder,
            ),

            const SizedBox(height: 24),
            Container(
              width: MediaQuery.sizeOf(context).width,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: NewColors.greenBG,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: LineColors.greenStroke),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'تعليقات ولي الأمر',
                    style: AppFonts.supHeading3(
                      color: NewColors.green,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            student.behavior.isEmpty
                                ? 'لا توجد تفاصيل'
                                : student.parentComments,
                            style: AppFonts.body2(color: NewColors.green)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            Divider(
              color: NewColors.inputBorder,
            ),

            const SizedBox(height: 24),
            Container(
              width: MediaQuery.sizeOf(context).width,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: NewColors.lightBG.withOpacity(0.3),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: LineColors.border),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ملاحظات إدارية',
                    style: AppFonts.supHeading3(
                      color: NewColors.supHeading,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            student.adminNotes.isEmpty
                                ? 'لا توجد تفاصيل'
                                : student.adminNotes,
                            style: AppFonts.body2(color: NewColors.body)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TableRowWidget extends StatelessWidget {
  final List<String> firstThree;
  final List<String> lastTwo;

  const TableRowWidget({
    super.key,
    required this.firstThree,
    required this.lastTwo,
  })  : assert(firstThree.length == 3, 'firstThree must have exactly 3 items'),
        assert(lastTwo.length == 2, 'lastTwo must have exactly 2 items');

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // First three columns
        Expanded(
          child: Row(
            children: [
              Text(firstThree[0]),
              const Spacer(),
              Text(firstThree[1]),
              const Spacer(),
              Text(firstThree[2]),
            ],
          ),
        ),

        const Spacer(flex: 2), // space between groups

        // Last two columns
        Expanded(
          child: Row(
            children: [
              Text(lastTwo[0]),
              const Spacer(),
              Text(lastTwo[1]),
            ],
          ),
        ),
      ],
    );
  }
}
