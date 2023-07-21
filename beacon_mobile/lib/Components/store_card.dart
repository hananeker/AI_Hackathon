import 'package:beacon/Models/store_model.dart';
import 'package:beacon/constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StoreCard extends StatelessWidget {
  const StoreCard({
    Key? key,
    required this.storeModel,
  }) : super(key: key);

  final StoreModel storeModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 90.h,
          width: 130.w,
          padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 12.h),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(15.r)),
            child: (storeModel.imageUrl != null)
                ? CachedNetworkImage(
                    imageUrl: '$baseApiPictureUrl/${storeModel.imageUrl}',
                    fit: BoxFit.fill,
                  )
                : Image.asset(
                    "images/boutique.jpg",
                  ),
          ),
        ),
        SizedBox(
          width: 10.w,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              storeModel.name,
              style: const TextStyle(
                fontFamily: 'Ubuntu',
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              storeModel.address,
              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    color: Colors.grey,
                    fontFamily: 'Ubuntu',
                  ),
            ),
          ],
        ),
      ],
    );
  }
}
