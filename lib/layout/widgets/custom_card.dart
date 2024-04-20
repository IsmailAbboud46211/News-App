// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:app_news/layout/screens/web_view.dart';
import 'package:app_news/layout/shared/colors.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomCard extends StatelessWidget {
  var width;
  var height;
  var imageUrl;
  var publishedAt;
  var title;
  var url;
  CustomCard(
      {super.key,
      required this.width,
      required this.height,
      required this.imageUrl,
      required this.title,
      required this.publishedAt,
      required this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => WebViewContainer(url: url),
        ),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              width: width * 0.75,
              height: height / 3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  width * 0.05,
                ),
              ),
              child: FancyShimmerImage(
                imageUrl: imageUrl ?? 'assets/no-image.png',
                shimmerBaseColor:
                    Theme.of(context).brightness == Brightness.dark
                        ? Colors.white10
                        : Colors.grey.shade300,
                shimmerHighlightColor:
                    Theme.of(context).brightness == Brightness.dark
                        ? Colors.white24
                        : Colors.grey.shade100,
                errorWidget: Padding(
                  padding: EdgeInsets.all(height * 0.02),
                  child: Container(
                    width: width * 0.75,
                    height: height / 3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        width * 0.05,
                      ),
                      image: DecorationImage(
                        image: Image.asset('assets/no-image.png').image,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                imageBuilder: (context, imageProvider) => Container(
                  width: width,
                  height: height * 0.25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      width * 0.05,
                    ),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                boxDecoration: BoxDecoration(
                  color: AppColors.softWhite,
                  borderRadius: BorderRadius.circular(
                    width * 0.05,
                  ),
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  width * 0.05,
                ),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    AppColors.lightBlue.withAlpha(150),
                    AppColors.lightBlue,
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: width * 0.02,
            left: width * 0.02,
            child: SizedBox(
              width: width * 0.6,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      color: AppColors.snow,
                      fontFamily: 'javanese-text',
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    publishedAt,
                    style: TextStyle(
                      color: AppColors.snow,
                      fontFamily: 'javanese-text',
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
