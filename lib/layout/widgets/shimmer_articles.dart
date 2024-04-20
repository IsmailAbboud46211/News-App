import 'package:app_news/layout/widgets/custom_divider.dart';
import 'package:app_news/layout/widgets/shimmer_artical.dart';
import 'package:flutter/material.dart';

class ShimmerArticalesWidet extends StatelessWidget {
  const ShimmerArticalesWidet({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    return SizedBox(
      height: height,
      child: ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => const ShimmerArtical(),
        separatorBuilder: (context, index) => customDivider(),
        itemCount: 10,
      ),
    );
  }
}
