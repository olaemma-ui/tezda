import 'dart:math';
import 'dart:developer' as dev;

import 'package:flutter/material.dart';
import 'package:tezda/core/theme/color_manager.dart';

import 'font_manager.dart';

Future<DateTime?> showCustomDatePicker(
  BuildContext context, {
  DateTime? initialDate,
  DateTime? firstDate,
  DateTime? lastDate,
  required Function(DateTime? date) confirm,
  required Function(DateTime? date)? skip,
}) async {
  DateTime? selectedDate = initialDate ?? DateTime.now();
  final List<DateTime> highlightedDates = [];

  void updateHighlightedDates(DateTime centerDate) {
    dev.log(
        'centerDate.difference(DateTime.now()).inDays = ${DateTime.now().difference(centerDate).inDays}');
    highlightedDates.clear();
    // Only calculate ±3 days if the date is in the future
    if (centerDate.isBefore(DateTime.now()) ||
        centerDate.isAtSameMomentAs(DateTime.now())) {
      for (int i = -3;
          i <= min(3, DateTime.now().difference(centerDate).inDays);
          i++) {
        final date = centerDate.add(Duration(days: i));
        // Ensure highlighted dates are within the valid range
        if ((firstDate == null || date.isAfter(firstDate)) &&
            (lastDate == null || date.isBefore(lastDate))) {
          highlightedDates.add(date);
        }
      }
    }
  }

  // updateHighlightedDates(selectedDate);

  await showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        contentPadding: const EdgeInsets.all(8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        content: StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CalendarDatePicker(
                      key: ValueKey(
                          selectedDate), // Force rebuild when date changes
                      initialDate: selectedDate!,
                      firstDate: firstDate ?? DateTime(1900),
                      lastDate: DateTime.now(),
                      currentDate: DateTime.now(),
                      onDateChanged: (date) {
                        setState(() {
                          selectedDate = date;
                          updateHighlightedDates(date);
                        });
                      },
                      selectableDayPredicate: (date) {
                        // Allow all dates to be selectable
                        return true;
                      },
                    ),
                    // Custom day styling using a Stack overlay
                    // This is a workaround since we can't directly customize CalendarDatePicker days
                    if (highlightedDates.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Wrap(
                          spacing: 4,
                          runSpacing: 4,
                          children: highlightedDates.map((date) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedDate = date;
                                });
                              },
                              child: Container(
                                width: 26,
                                height: 26,
                                decoration: BoxDecoration(
                                  color: DateUtils.isSameDay(date, selectedDate)
                                      ? ColorManager.primary
                                      : ColorManager.primary.withOpacity(0.2),
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: Text(
                                    '${date.day}',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: DateUtils.isSameDay(
                                              date, selectedDate)
                                          ? Colors.white
                                          : ColorManager.primary,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (skip != null) ...[
                          Expanded(
                            child: TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                skip(null);
                              },
                              style: TextButton.styleFrom(
                                side: const BorderSide(
                                  width: 1,
                                  color: ColorManager.primary,
                                ),
                                backgroundColor: Colors.transparent,
                              ),
                              child: Text(
                                'Skip',
                                style: FontManager.getTextStyle(
                                  color: ColorManager.primary,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8)
                        ],
                        Expanded(
                          child: TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              confirm(selectedDate);
                            },
                            child: Text(
                              'Confirm',
                              style: FontManager.getTextStyle(
                                color: ColorManager.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
    },
  );
  return selectedDate;
}
