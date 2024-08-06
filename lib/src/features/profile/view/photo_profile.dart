import 'package:absensi_riverpod/core/config/base_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:full_screen_image_null_safe/full_screen_image_null_safe.dart';

import '../../../../core/config/const.dart';
import '../../../global/providers/common_providers.dart';
import '../../../shared/cache_network_image.dart';

class PhotoFrofile extends ConsumerWidget{
  const PhotoFrofile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dataUser = ref.watch(currentUserProvider);
    return Padding(
          padding: const EdgeInsets.symmetric(vertical: 150, horizontal: 28),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(5)),
            height: 140,
            width: 140,
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                  side: BorderSide(width: 2, color: grey)),
              child: FullScreenWidget(
                child: Hero(
                  tag: 'customTag',
                  child: ClipRect(
                    child: dataUser!.foto != ""
                        ? CsCacheNetImg(
                            url: '${BasePaths.baseProdUrl}/${dataUser.foto}')
                        : Image.network(
                            "https://ui-avatars.com/api/?name=ade",
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
              ),
            ),
          ),
        );
  }
  
}