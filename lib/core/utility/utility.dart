import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tasks_board/constants/colors/colors.dart';

import '../../constants/enums/tasks_enums.dart';

/// This class contain all helper method :
/// showToast, hexColor , changeStatusBarToBlack , changeStatusBarToTransparent and so on
class Utility {
  /// This function to show Toast message in the bottom of screen with message
  static showToast(
      {ToastGravity gravity = ToastGravity.BOTTOM,
      Color? textColor,
      required String message}) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: gravity,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 15.0);
  }

  /// This function to get the corsponding color of the task priority
  static Color getPriorityColor(TaskPriorityEnum priority) {
    switch (priority) {
      case TaskPriorityEnum.lowPriority:
        return AppColors.lowPriorityColor;
      case TaskPriorityEnum.mediumPriority:
        return AppColors.mediunPriorityColor;
      case TaskPriorityEnum.highPriority:
        return AppColors.highPriorityColor;
      default:
        return AppColors.mediunPriorityColor;
    }
  }
  // this function will generate a unique id 
  static String getCustomUniqueId() {
  const String pushChars =
      '-0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ_abcdefghijklmnopqrstuvwxyz';
  int lastPushTime = 0;
  List lastRandChars = [];
  int now = DateTime.now().millisecondsSinceEpoch;
  bool duplicateTime = (now == lastPushTime);
  lastPushTime = now;
  List timeStampChars = List<String>.filled(8, '0');
  for (int i = 7; i >= 0; i--) {
    timeStampChars[i] = pushChars[now % 64];
    now = (now / 64).floor();
  }
  if (now != 0) {
   debugPrint("Id should be unique");
  }
  String uniqueId = timeStampChars.join('');
  if (!duplicateTime) {
    for (int i = 0; i < 12; i++) {
      lastRandChars.add((Random().nextDouble() * 64).floor());
    }
  } else {
    int i = 0;
    for (int i = 11; i >= 0 && lastRandChars[i] == 63; i--) {
      lastRandChars[i] = 0;
    }
    lastRandChars[i]++;
  }
  for (int i = 0; i < 12; i++) {
    uniqueId += pushChars[lastRandChars[i]];
  }
  return uniqueId;
}
}
