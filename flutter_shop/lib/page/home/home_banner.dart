import 'package:flutter/material.dart';
import 'package:flutter_shop/model/home_content_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper_tv/flutter_swiper.dart';

class HomeBanner extends StatelessWidget {

  List<HomeBannerModel> _banners;


  HomeBanner(this._banners);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: ScreenUtil().setHeight(333),
      width: ScreenUtil().setWidth(750),
      child: Swiper(
        itemBuilder: (context, index) {
          return InkWell(
            child: Image.network(
              _banners[index].image,
              fit: BoxFit.cover,
            ),
          );
        },
        itemCount: _banners.length,
        pagination: SwiperPagination(),
        control: SwiperControl(),
        controller: SwiperController(),
        autoplay: true,
      ),
    );
  }
}
