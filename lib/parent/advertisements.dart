import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:royal/theme/colors.dart';
import 'package:royal/theme/fonts.dart';

class Advertisements extends StatefulWidget {
  const Advertisements({super.key});

  @override
  State<Advertisements> createState() => _AdvertisementsState();
}

class _AdvertisementsState extends State<Advertisements> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NewColors.alwaysWhite,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.07,
            ),
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
                SizedBox(
                  width: 10,
                ),
                Text(
                  'الإعلانات',
                  style: AppFonts.body2(color: NewColors.supHeading),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.all(1),
                itemCount: 6,
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
                        builder: (context) => const _AnnouncementDetailsSheet(),
                      );
                    },
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/announcements.png',
                          height: MediaQuery.sizeOf(context).width * 0.065,
                          width: MediaQuery.sizeOf(context).width * 0.065,
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'نحيطكم علماً ببدء فترة التسجيل للفصل الدراسي الثاني اعتبارًا من 15 يناير 2025.',
                                style: AppFonts.supHeading4(
                                    color: NewColors.supHeading),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                'اليوم 11:00ص',
                                style: AppFonts.body4(color: NewColors.body),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(width: 8),
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
    );
  }
}

class _AnnouncementDetailsSheet extends StatelessWidget {
  const _AnnouncementDetailsSheet();

  @override
  Widget build(BuildContext context) {
    return Container(color: NewColors.alwaysWhite,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 20, 16, 30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () => Navigator.pop(context),
                  child:  Image.asset('assets/images/Close Button Container.png',
                  height: MediaQuery.sizeOf(context).width * 0.1,
                  width: MediaQuery.sizeOf(context).width * 0.1,),
                ),
               SizedBox(width: 20,),
                Text('تفاصيل الإعلان',
                    style: AppFonts.supHeading2(color: NewColors.supHeading)),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              '🔔 إعلان بدء التسجيل للفصل الدراسي الثاني',
              style: AppFonts.headingH5(color: NewColors.heading),
            ),
            const SizedBox(height: 10),
            Text(
              'نحيطكم علمًا ببدء فترة التسجيل للفصل الدراسي الثاني في حضانة رويال بيبي اعتبارًا من يوم الاثنين 15 يناير 2025، وذلك للفئات العمرية من سنة ونصف حتى خمس سنوات.',
              style: AppFonts.caption1(color: NewColors.caption),
            ),
            const SizedBox(height: 16),
            Text('تفاصيل التسجيل:',
                style: AppFonts.body2(color: NewColors.supHeading)),
            const SizedBox(height: 8),
            Text('• يبدأ التسجيل: 15 يناير 2025',
                style: AppFonts.body2(color: NewColors.supHeading)),
            Text('• ينتهي التسجيل: 31 يناير 2025',
                style: AppFonts.body2(color: NewColors.supHeading)),
            Text('• أولوية القبول للطلاب الحاليين، يليها النقل.',
                style: AppFonts.body2(color: NewColors.supHeading)),
            Text('• يشترط تحديث بيانات الطفل وولي الأمر.',
                style: AppFonts.body2(color: NewColors.supHeading)),
            const SizedBox(height: 16),
            Text('المستندات المطلوبة للتسجيل الجديد:',
                style: AppFonts.body2(color: NewColors.supHeading)),
            const SizedBox(height: 8),
            Text('• صورة من شهادة ميلاد الطفل.',
                style: AppFonts.body2(color: NewColors.supHeading)),
            Text('• نسخة من بطاقة ولي الأمر.',
                style: AppFonts.body2(color: NewColors.supHeading)),
            Text('• صورة شخصية حديثة للطفل.',
                style: AppFonts.body2(color: NewColors.supHeading)),
            Text('• شهادة التطعيمات الأساسية.',
                style: AppFonts.body2(color: NewColors.supHeading)),
          ],
        ),
      ),
    );
  }
}
