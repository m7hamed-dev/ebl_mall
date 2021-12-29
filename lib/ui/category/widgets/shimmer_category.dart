import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerCategory extends StatelessWidget {
  const ShimmerCategory({Key? key}) : super(key: key);

  //
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.0,
      margin: const EdgeInsets.all(4.0),
      child: ListView.builder(
          itemCount: 4,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (c, i) {
            return Container(
              height: 60.0,
              width: 100.0,
              margin: const EdgeInsets.all(4.0),
              // color: Colors.red,
              child: Shimmer.fromColors(
                child: const Card(color: Colors.grey),
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
              ),
            );
          }),
    );
  }
}
