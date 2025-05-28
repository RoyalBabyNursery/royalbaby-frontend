import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:royal/theme/fonts.dart';
import '../theme/colors.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Directionality( // ✅ أضف دي
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: NewColors.alwaysWhite,
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 15,),
              Text(
                'الاشعارات',
                style: AppFonts.headingH4(color: NewColors.heading),
              ),
              SizedBox(height: 20,),
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.all(1),
                  itemCount: 5,
                  separatorBuilder: (_, __) => const Divider(
                    color: LineColors.line,
                    thickness: 1,
                    height: 30,
                  ),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(24),
                              topRight: Radius.circular(24),
                            ),
                          ),
                          builder: (_) => const _NotificationDetailsSheet(),
                        );
                      },
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/notification1.png',
                            height: MediaQuery.sizeOf(context).width * 0.065,
                            width: MediaQuery.sizeOf(context).width * 0.065,
                          ),
                          const SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'الواجب الأول في الفتره الثانية',
                                style: AppFonts.supHeading4(color: NewColors.supHeading),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                'اليوم 11:00ص',
                                style: AppFonts.body4(color: NewColors.body),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Image.asset(
                            'assets/images/Vector.png',
                            height: MediaQuery.sizeOf(context).width * 0.065,
                            width: MediaQuery.sizeOf(context).width * 0.065,
                          )
                        ],
                      ),
                    );
                  },

                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NotificationDetailsSheet extends StatelessWidget {
  const _NotificationDetailsSheet();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(color: NewColors.alwaysWhite,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 20, 16, 30),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Header
                Row(
                  children: [
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Image.asset(
                        'assets/images/Close Button Container.png',
                        height: MediaQuery.sizeOf(context).width * 0.09,
                        width: MediaQuery.sizeOf(context).width * 0.09,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Text(
                      'تفاصيل الاشعار',
                      style: AppFonts.supHeading2(color: NewColors.supHeading),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                Text(
                  '📘 تنويه هام – الواجب الأول للفترة الثانية',
                  style: AppFonts.headingH5(color: NewColors.heading),
                ),
                const SizedBox(height: 12),
                Text(
                  'نود إبلاغكم بأنه قد تم إرسال الواجب الأول الخاص بالفترة الدراسية الثانية لأطفالكم، ويرجى منكم التكرم بالاطلاع عليه ومساعدتهم في إنجازه.',
                  style: AppFonts.caption1(color: NewColors.caption),
                ),
                const SizedBox(height: 20),

                Text('تفاصيل الواجب:', style: AppFonts.body2(color: NewColors.supHeading)),
                const SizedBox(height: 15),
                Text('• يشمل المهارات التي تم تدريب الأطفال عليها خلال الأسابيع الماضية.',
                    style: AppFonts.body2(color: NewColors.supHeading)),
                Text('• يهدف إلى تعزيز التعلم من خلال الأنشطة المنزلية التفاعلية.',
                    style: AppFonts.body2(color: NewColors.supHeading)),
                Text('• صُمم بطريقة مبسطة ومناسبة لكل مرحلة عمرية.',
                    style: AppFonts.body2(color: NewColors.supHeading)),

                const SizedBox(height: 20),
                Text('تاريخ التسليم:', style: AppFonts.body2(color: NewColors.supHeading)),
                const SizedBox(height: 15),
                Text('• يرجى إعادة الواجب إلى الحضانة في موعد أقصاه يوم الخميس 23 يناير 2025.',
                    style: AppFonts.body2(color: NewColors.supHeading)),
                const SizedBox(height: 20),
                Text('ملاحظات لولي الأمر:', style: AppFonts.body2(color: NewColors.supHeading)),
                const SizedBox(height: 15),
                Text('• لا يشترط حل الواجب بشكل مثالي، بل الهدف هو التفاعل مع الطفل وتعزيز فهمه.',
                    style: AppFonts.body2(color: NewColors.supHeading)),
                Text('• في حال وجود أي استفسار أو صعوبة، يمكنكم التواصل مع معلمة الصف.',
                    style: AppFonts.body2(color: NewColors.supHeading)),
                SizedBox(height: 20,),
                Text('💡 شكرًا لتعاونكم المستمر معنا في دعم العملية التعليمية لأطفالكم.',
                    style: AppFonts.body2(color: NewColors.supHeading)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

