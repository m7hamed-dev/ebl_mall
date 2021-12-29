import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerProfile extends StatelessWidget {
  //
  const ShimmerProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //
    return Column(
      children: [
        Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Container(
            height: 150.0,
            color: Colors.green,
            margin: const EdgeInsets.all(8.0),
          ),
        ),
        Expanded(
          child: GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: List.generate(
              4,
              (index) => Shimmer.fromColors(
                child: Container(
                  width: 193,
                  height: 195,
                  margin: const EdgeInsets.all(4.0),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 9,
                        child: Container(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
