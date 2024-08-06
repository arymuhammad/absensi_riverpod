import 'package:absensi_riverpod/core/config/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:shimmer/shimmer.dart';

class CsShimmer extends StatelessWidget {
  const CsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(bottom: 20.0, left: 5.0, right: 5.0),
      itemCount: 3,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: SizedBox(
            height: 70.0,
            child: Shimmer.fromColors(
              baseColor: white,
              highlightColor: grey,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: white,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
