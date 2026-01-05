import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class NowSkeleton extends StatelessWidget {
  const NowSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: ListView.builder(
        shrinkWrap: true,
        physics: AlwaysScrollableScrollPhysics(),
        itemCount: 5,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Container(width: 80, height: 120, color: Colors.grey[800]),
            title: Container(height: 20, color: Colors.grey[800]),
            subtitle: Container(height: 40, color: Colors.grey[800]),
          );
        },
      ),
    );
  }
}
