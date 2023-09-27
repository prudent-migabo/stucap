import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:stucap/static/statics.dart';


class CustomAvatarImage extends StatelessWidget {
  const CustomAvatarImage(
      {Key? key, this.radius, this.imageProvider, this.imgUrl})
      : super(key: key);

  final double? radius;
  final ImageProvider? imageProvider;
  final String? imgUrl;

  @override
  Widget build(BuildContext context) {
    return imgUrl == ''
        ? CircleAvatar(
            radius: radius ?? 25,
            backgroundColor: Colors.transparent,
      backgroundImage: const AssetImage(Assets.avatar),
          )
        : CachedNetworkImage(
            imageUrl: imgUrl!,
            imageBuilder: (context, imageProvider) {
              return CircleAvatar(
                radius: radius ?? 25,
                backgroundImage: NetworkImage(imgUrl!),
              );
            },
          );
  }
}
