import 'package:app_news/layout/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerArtical extends StatelessWidget {
  const ShimmerArtical({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;
    return Shimmer.fromColors(
      baseColor: Theme.of(context).brightness == Brightness.dark
          ? Colors.white10
          : Colors.grey.shade300,
      highlightColor: Theme.of(context).brightness == Brightness.dark
          ? Colors.white24
          : Colors.grey.shade100,
      child: Padding(
        padding: EdgeInsets.all(
          width * 0.02,
        ),
        child: Row(
          children: [
            Container(
              width: width * 0.3,
              height: height * 0.12,
              decoration: BoxDecoration(
                color: AppColors.softWhite,
                borderRadius: BorderRadius.circular(
                  width * 0.05,
                ),
              ),
            ),
            SizedBox(
              width: width * 0.05,
            ),
            Expanded(
                child: Padding(
              padding: EdgeInsets.only(top: width * 0.04, right: width * 0.02),
              child: SizedBox(
                height: height * 0.11,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: height / 80,
                    ),
                    Container(
                      width: width * 0.6,
                      height: height / 75,
                      color: AppColors.softWhite,
                    ),
                    SizedBox(
                      height: height / 75,
                    ),
                    Container(
                      width: width * 0.6,
                      height: height / 75,
                      color: AppColors.softWhite,
                    ),
                    SizedBox(
                      height: height / 75,
                    ),
                    Container(
                      width: width * 0.6,
                      height: height / 75,
                      color: AppColors.softWhite,
                    ),
                    SizedBox(
                      height: height / 80,
                    ),
                    Container(
                      width: width * 0.3,
                      height: height / 80,
                      color: AppColors.softWhite,
                    ),
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
