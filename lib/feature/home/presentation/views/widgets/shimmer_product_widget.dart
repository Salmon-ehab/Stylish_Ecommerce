import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerProductWidget extends StatelessWidget {
  const ShimmerProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.55,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  );
                },
                childCount: 6,
              ),
            );
  }
}