import 'package:cafepia/common/styles/spaceing_styles.dart';
import 'package:cafepia/features/personalization/provider/profile_provider.dart';
import 'package:cafepia/features/personalization/screens/profile/profile.dart';
import 'package:cafepia/utils/constants/colors.dart';
import 'package:cafepia/utils/constants/sizes.dart';
import 'package:cafepia/utils/device/device_utility.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class TAppBarProfile extends StatelessWidget implements PreferredSizeWidget {
  const TAppBarProfile({Key? key});

  @override
  Widget build(BuildContext context) {
    final Profile? profile = Provider.of<ProfileProvider>(context).profile;
    print('Profile');
    print(profile!.photoUrl);
    return AppBar(
      backgroundColor: Theme.of(context).primaryColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(30),
        ),
      ),
      flexibleSpace: Container(
        // height: TSizes.appBarHeight * 3,
        padding: TSpacingStyle.paddingWithAppBarHeight,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3), // Shadow color with opacity
              spreadRadius: 5, // Spread radius
              blurRadius: 30, // Blur radius
              offset: Offset(0, 2), // Offset in x and y direction
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(profile.name,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: TColors.textWhite, fontSize: 22)),
                Text('Let’s find your café !',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: TColors.textWhite))
              ],
            ),
            SizedBox(
              width: 70,
              height: 70,
              child: CircleAvatar(
                backgroundImage: profile.photoUrl != null
                    ? NetworkImage(profile.photoUrl!)
                    : const AssetImage('assets/images/default_profile.png')
                        as ImageProvider,
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(TDeviceUtils.getAppBarHeight() + TSizes.appBarHeight);
}
