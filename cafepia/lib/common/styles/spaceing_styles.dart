import 'package:flutter/material.dart';
import 'package:cafepia/utils/constants/sizes.dart';
import 'package:cafepia/utils/device/device_utility.dart';

class TSpacingStyle {
  static EdgeInsetsGeometry get paddingWithAppBarHeight =>
      EdgeInsets.only(
        top: TDeviceUtils.getAppBarHeight(),
        left: TSizes.defaultSpace,
        right: TSizes.defaultSpace,
        bottom: TSizes.defaultSpace,
      );
}
