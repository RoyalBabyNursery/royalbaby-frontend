import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:royalbabyapp/riverpod_prov.dart';
import 'package:royalbabyapp/theme/colors.dart';
import 'package:royalbabyapp/theme/fonts.dart';
import 'package:royalbabyapp/teacher/classes/new_class_page.dart';

class ReportsScreen extends ConsumerWidget {
  const ReportsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(reportFilterProvider);

    // ✅ Schedule provider update after build
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(isFromReportsScreenProvider.notifier).state = true;
    });

    return Scaffold(
      backgroundColor: NewColors.alwaysWhite,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),
            Text('التقارير',
                style: AppFonts.headingH4(color: NewColors.heading)),
            const SizedBox(height: 16),

            // 🔹 Filter Chips Row
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                FilterChip(
                  label: Text(
                    'يومي',
                    style: TextStyle(
                      color: filter == ReportFilter.daily
                          ? Colors.white
                          : NewColors.primary500, // text color change
                    ),
                  ),
                  selected: filter == ReportFilter.daily,
                  onSelected: (_) => ref
                      .read(reportFilterProvider.notifier)
                      .state = ReportFilter.daily,
                  selectedColor: NewColors.primary500,
                  backgroundColor: NewColors.alwaysWhite,
                  showCheckmark: false,
                ),
                const SizedBox(width: 8),
                FilterChip(
                  label: Text(
                    'أسبوعي',
                    style: TextStyle(
                      color: filter == ReportFilter.weekly
                          ? Colors.white
                          : NewColors.primary500, // text color change
                    ),
                  ),
                  selected: filter == ReportFilter.weekly,
                  onSelected: (_) => ref
                      .read(reportFilterProvider.notifier)
                      .state = ReportFilter.weekly,
                  selectedColor: NewColors.primary500,
                  backgroundColor: NewColors.alwaysWhite,
                  // shape: RoundedRectangleBorder(
                  //   borderRadius: BorderRadius.circular(24),
                  //   side: BorderSide(color: NewColors.primary500),
                  // ),
                  showCheckmark: false,
                ),
                const SizedBox(width: 8),
                FilterChip(
                  label: Text(
                    'شهري',
                    style: TextStyle(
                      color: filter == ReportFilter.monthly
                          ? Colors.white
                          : NewColors.primary500, // text color change
                    ),
                  ),
                  selected: filter == ReportFilter.monthly,
                  onSelected: (_) => ref
                      .read(reportFilterProvider.notifier)
                      .state = ReportFilter.monthly,
                  selectedColor: NewColors.primary500,
                  backgroundColor: NewColors.alwaysWhite,
                  showCheckmark: false,
                ),
              ],
            ),

            const SizedBox(height: 16),

            // 🔹 Classes List (Filtered View)
            Expanded(
              child: Classes(),
            ),
          ],
        ),
      ),
    );
  }
}
