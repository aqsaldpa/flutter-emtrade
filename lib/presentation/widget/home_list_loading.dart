import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class HomeListLoading extends StatelessWidget {
  const HomeListLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.62,
      child: Shimmer.fromColors(
        baseColor: const Color(0xFFa1a1a1),
        highlightColor: const Color(0xFFe1e1e1),
        child: ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          itemCount: 6,
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: Container(
                width: 80,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.grey[400],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
