import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NoInternet extends StatelessWidget {
  const NoInternet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: height * 0.25,
          ),
          SvgPicture.asset(
            'assets/no-wifi.svg',
            width: width * 0.125,
            height: height * 0.125,
          ),
          Padding(
            padding: EdgeInsets.only(left: width * 0.02),
            child: const Text(
              " There is no internet currently",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'javanese-text',
              ),
            ),
          ),
          const Text(
            "  Please check your internet connection !",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'javanese-text',
            ),
          ),
        ],
      ),
    );
  }
}
