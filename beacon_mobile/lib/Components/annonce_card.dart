import 'package:beacon/Models/annonce_model.dart';
import 'package:beacon/constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnnonceCard extends StatelessWidget {
  const AnnonceCard({
    Key? key,
    required this.index,
    required this.annonceModel,
  }) : super(key: key);

  final int index;
  final AnnonceModel annonceModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.h,
      width: 350.w,
      margin: EdgeInsets.only(
        right: (index == 0) ? 20.w : 0,
        left: (index == 2) ? 20.w : 0,
      ),
      // padding:  EdgeInsets.only(left: 20.w, right: 20, bottom: 12),
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: CachedNetworkImageProvider(
                'http://10.0.2.2:8000/upload/pictures/1659301521.jpg',
                headers: {"Connection": "keep-alive", "Keep-alive": ""},
              ),
              fit: BoxFit.fill),
          borderRadius: BorderRadius.all(Radius.circular(35))),
    );
  }
}
