import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tentwenty_movie_app/Utils/app_colors.dart';
import 'package:tentwenty_movie_app/Utils/image_constants.dart';

class CacheNetworkImageWidget extends StatefulWidget {
  final String imgUrl;
  final double? height;
  final double? width;
  final double radius;
  final double? builderHeight;
  final double? builerWidth;

  const CacheNetworkImageWidget(
      {Key? key,
      required this.imgUrl,
      this.height,
      this.width,
      required this.radius,
      this.builderHeight = 90,
      this.builerWidth = 120})
      : super(key: key);

  @override
  State<CacheNetworkImageWidget> createState() =>
      _CacheNetworkImageWidgetState();
}

class _CacheNetworkImageWidgetState extends State<CacheNetworkImageWidget> {
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      height: widget.height,
      width: widget.width,
      imageBuilder: (context, imageProvider) => Container(
        width: widget.builerWidth,
        height: widget.builderHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.radius),
          // border: Border.all(width: 1.2, color: Colors.white),
          image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
        ),
      ),
      imageUrl: widget.imgUrl,
      fit: BoxFit.cover,
      progressIndicatorBuilder: (context, url, downloadProgress) =>
          const SpinKitPulse(
        color: AppColors.purpleColor,
        size: 22,
        //    type: SpinKitWaveType.start
      ),
      errorWidget: (context, url, error) => Container(
        //strokeWidth: 0,
        height: widget.builderHeight!,
        width: widget.builerWidth!,

        //decoration: Boxed,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(13),
          child: Image.asset(
            ImageConstants.imagePlaceHolder,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
