import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget errorWidget({required height, required width}) => Center(
      child: Column(
        children: [
          SizedBox(
            height: height * 0.25,
          ),
          SvgPicture.asset(
            'assets/error-icon.svg',
            width: width * 0.125,
            height: height * 0.125,
          ),
          const Text(
            "Sorry, There is an issue :( ",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'javanese-text',
            ),
          )
        ],
      ),
    );
