import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppImage extends StatelessWidget {

  final String url;
  final double? width,height;
  final BoxFit fit;

  final Color? color;
  const AppImage( this.url,{super.key, this.width, this.height, this.fit=BoxFit.scaleDown, this.color });

  @override
  Widget build(BuildContext context) {
    if(url.endsWith("svg")){
      return SvgPicture.asset("assets/svg/${url}",
      width: width?.w,
      height: height?.h,
      fit: fit,
      color: color ,
      );
    }else if(url.startsWith("http")){
      return Image.network(url,
        width: width?.w,
        height: height?.h,
        fit: fit,
        color: color ,
      errorBuilder: (context, error, stackTrace) => Icon(Icons.error),);
    }else{
      return Image.asset("assets/images/${url}",
        width: width?.w,
        height: height?.h,
        fit: fit,
        color: color ,
      errorBuilder: (context, error, stackTrace) => Icon(Icons.error),);
    }

  }
}
