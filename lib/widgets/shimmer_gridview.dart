import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerGridView extends StatelessWidget {
  //
  const ShimmerGridView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //
    return GridView.count(
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
          // baseColor: Colors.grey.shade100,
          // highlightColor: Colors.orange.shade100,
          baseColor: Colors.grey.shade200,
          highlightColor: Colors.grey.shade100,
        ),
      ),
    );
  }
}
