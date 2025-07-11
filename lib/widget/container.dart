import 'package:flutter/material.dart';
import 'package:royal/theme/colors.dart';
import 'package:royal/theme/fonts.dart';

class DailyEvaluationCard extends StatelessWidget {
  final String day;
  final String date;
  final String evaluation;

  const DailyEvaluationCard({
    super.key,
    required this.day,
    required this.date,
    required this.evaluation,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: NewColors.lightBG.withOpacity(0.3),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: LineColors.border),
      ),
      child: Row(
        children: [
          Image.asset(
            'assets/images/calendar.png',
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(day, style: AppFonts.headingH6(color: NewColors.heading)),
              const SizedBox(height: 4),
              Text(date, style: AppFonts.body4(color: NewColors.body)),
            ],
          ),
          const Spacer(),
          Text(
            'التقييم: $evaluation',
            style: AppFonts.body4(color: NewColors.body),
          ),
          SizedBox(
            width: 5,
          ),
          Image.asset(
            'assets/images/star.png',
          ),
        ],
      ),
    );
  }
}

class TeacherNoteCard extends StatelessWidget {
  final String title;
  final String note;

  const TeacherNoteCard({
    super.key,
    required this.title,
    required this.note,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: NewColors.greenBG,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: LineColors.greenStroke),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppFonts.supHeading3(color: NewColors.green),
          ),
          const SizedBox(height: 10),
          Text(
            note,
            style: AppFonts.body3(color: NewColors.green),
            textAlign: TextAlign.right,
          ),
        ],
      ),
    );
  }
}

class HelpForMore extends StatelessWidget {
  final String title;
  final String note;
  final String image;
  final VoidCallback? onTap;

  const HelpForMore({
    super.key,
    required this.title,
    required this.note,
    required this.image,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0,bottom: 12),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            Container(
              height: MediaQuery.sizeOf(context).width*0.1,
              width: MediaQuery.sizeOf(context).width*0.1,
              decoration: BoxDecoration(
                color: NewColors.grayBox,
                borderRadius: BorderRadius.circular(10)
              ),
              child: Image.asset(image),
            ),
            SizedBox(width: 12,),
            Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,style: AppFonts.supHeading3(color: NewColors.supHeading),),
                SizedBox(height: 8,),
                Text(note,style: AppFonts.body5(color: NewColors.caption),),
              ],
            ),
            Spacer(),
            Image.asset('assets/images/Vector.png')
          ],
        ),
      ),
    );
  }
}

class ProfileHelp extends StatelessWidget {
  final String title;
  final String note;

  const ProfileHelp({
    super.key,
    required this.title,
    required this.note,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0,bottom: 12),
      child: Row(
        children: [
          Text(title,style: AppFonts.body3(color: NewColors.caption),),
          Spacer(),
          Text(note,style: AppFonts.body3(color: NewColors.supHeading),),
        ],
      ),
    );
  }
}

class RegulationHelp extends StatelessWidget {
  final String title;
  final String note;

  const RegulationHelp({
    super.key,
    required this.title,
    required this.note,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0,bottom: 12),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,style: AppFonts.supHeading3(color: NewColors.supHeading),),
          SizedBox(height: 5,),
          Text(note,style: AppFonts.caption2(color: NewColors.caption),),
        ],
      ),
    );
  }
}


class SettingHelp extends StatelessWidget {
  final String title;
  final String note;
  final VoidCallback? onTap;

  const SettingHelp({
    super.key,
    required this.title,
    required this.note,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Row(
          children: [
            Text(title,style: AppFonts.supHeading3(color: NewColors.supHeading),),
            Spacer(),
            Text(note,style: AppFonts.body4(color: NewColors.body),),
            SizedBox(width: 8,),
            Image.asset('assets/images/Dropdown Icon4.png')
          ],
        ),
      ),
    );
  }
}

class FaqHelp extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;

  const FaqHelp({
    super.key,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: AppFonts.supHeading3(color: NewColors.supHeading),
                overflow: TextOverflow.visible,
                softWrap: true,
              ),
            ),
            const SizedBox(width: 8),
            Image.asset('assets/images/Dropdown Icon3.png'),
          ],
        ),
      ),
    );
  }
}


class AboutHelp extends StatelessWidget {
  final String title;
  final List<String> notes;

  const AboutHelp({
    super.key,
    required this.title,
    required this.notes,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppFonts.supHeading3(color: NewColors.supHeading),
          ),
          const SizedBox(height: 12),
          ...notes.expand((note) => [
            Text(
              note,
              style: AppFonts.caption2(color: NewColors.caption),
            ),
            const SizedBox(height: 8),
          ]),
        ],
      ),
    );
  }
}

