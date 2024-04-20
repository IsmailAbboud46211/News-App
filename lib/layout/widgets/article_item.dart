import 'package:app_news/layout/screens/web_view.dart';
import 'package:app_news/layout/shared/colors.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

Widget articleItem({required article, required context}) {
  var width = MediaQuery.sizeOf(context).width;
  var height = MediaQuery.sizeOf(context).height;
  return Padding(
    padding: EdgeInsets.all(
      width * 0.02,
    ),
    child: GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => WebViewContainer(url: article['url']),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: width * 0.3,
            height: height * 0.12,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                width * 0.05,
              ),
            ),
            child: FancyShimmerImage(
              imageUrl: article["urlToImage"] ?? 'assets/no-image.png',
              shimmerBaseColor: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white10
                  : Colors.grey.shade300,
              shimmerHighlightColor:
                  Theme.of(context).brightness == Brightness.dark
                      ? Colors.white24
                      : Colors.grey.shade100,
              errorWidget: Container(
                width: width * 0.3,
                height: height * 0.12,
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
              imageBuilder: (context, imageProvider) => Container(
                width: width * 0.3,
                height: height * 0.12,
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
          SizedBox(
            width: width * 0.05,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: width * 0.02, right: width * 0.02),
              child: SizedBox(
                height: height * 0.11,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: Text(
                        '${article["title"]}',
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          fontFamily: 'javanese-text',
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      '${article["publishedAt"]}',
                      style: TextStyle(
                        color: AppColors.grey,
                        fontFamily: 'javanese-text',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    ),
  );
}
