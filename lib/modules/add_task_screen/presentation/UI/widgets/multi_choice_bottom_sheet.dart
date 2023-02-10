import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasks_board/routes/routes_provider.dart';

import '../../../../../constants/colors/colors.dart';
import '../../../../../constants/text_styles/text_styles.dart';

class MultiChoiceBottomSheet extends StatelessWidget {
  const MultiChoiceBottomSheet({super.key, required this.items});

  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return Wrap(children: [
      Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.r),
                topRight: Radius.circular(10.r))),
        child: ListView.builder(
          shrinkWrap: true,
          itemBuilder: (context, index) => Column(
            children: [
              SizedBox(
                height: 20.h,
              ),
              InkWell(
                onTap: () {
                  RoutingProvider.goBackWithResult(items[index]);
                },
                child: Text(
                  items[index],
                  style: AppTextStyles.nunitoBold(),
                ),
              ),
              if (index == items.length - 1)
                SizedBox(
                  height: 20.h,
                ),
            ],
          ),
          itemCount: items.length,
        ),
      )
    ]);
  }
}
