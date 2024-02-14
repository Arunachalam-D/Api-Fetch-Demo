import 'package:flutter/material.dart';
import 'package:flutter_demo_task/core/constants/colors.dart';

Container statusWidget(String string) {
  return Container(
    padding: const EdgeInsets.all(5),
    decoration: BoxDecoration(
      color: (string == 'Draft')
          ? TaskColors.statusOrangeText
          : (string == 'Published')
              ? TaskColors.statusGreenText
              : (string == 'In-Use')
                  ? TaskColors.statusPurpleText
                  : (string == 'Cancelled')
                      ? TaskColors.statusRedText
                      : TaskColors.statusBlueText,
      borderRadius: BorderRadius.circular(5),
    ),
    child: Text(
      string,
      style: (string == 'Draft')
          ? const TextStyle(
              color: TaskColors.statusOrangeBackground, fontSize: 10)
          : (string == 'Published')
              ? const TextStyle(
                  color: TaskColors.statusGreenBackground, fontSize: 10)
              : (string == 'In-Use')
                  ? const TextStyle(
                      color: TaskColors.statusPurpleBackground, fontSize: 10)
                  : (string == 'Cancelled')
                      ? const TextStyle(
                          color: TaskColors.statusRedBackground, fontSize: 10)
                      : const TextStyle(
                          color: TaskColors.statusBlueBackground, fontSize: 10),
    ),
  );
}
