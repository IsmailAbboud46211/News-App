import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget emptySearchWidget({required height, required width}) => Column(
      children: [
        SizedBox(
          height: height * 0.25,
        ),
        SvgPicture.asset(
          'assets/search-icon.svg',
          width: width * 0.125,
          height: height * 0.125,
        ),
        const Text(
          "Waht are you looking for ?",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'javanese-text',
          ),
        )
      ],
    );
