import 'package:flutter/material.dart';
import 'package:video_calling_app/common/asset_image.dart';
import 'package:video_calling_app/constants/dimens.dart';
import 'package:video_calling_app/constants/strings.dart';
import 'package:video_calling_app/constants/styles.dart';
import 'package:video_calling_app/helpers/utility.dart';

class ServerMaintenanceView extends StatelessWidget {
  const ServerMaintenanceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var lastExitTime = DateTime.now();
    return WillPopScope(
      onWillPop: () async {
        if (DateTime.now().difference(lastExitTime) >=
            const Duration(seconds: 2)) {
          AppUtility.showSnackBar(
            'Press the back button again to exit the app',
            '',
            duration: 2,
          );
          lastExitTime = DateTime.now();

          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Container(
            width: Dimens.screenWidth,
            height: Dimens.screenHeight,
            padding: Dimens.edgeInsets16,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                NxAssetImage(
                  imgAsset: AssetValues.error,
                  width: Dimens.screenWidth * 0.5,
                  height: Dimens.screenWidth * 0.5,
                ),
                Dimens.boxHeight16,
                Text(
                  'Server Maintenance',
                  style: AppStyles.style20Bold,
                  textAlign: TextAlign.center,
                ),
                Dimens.boxHeight8,
                Text(
                  'We sincerely apologize for the inconvenience.',
                  style: AppStyles.style14Normal,
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Our server is under maintenance and will return shortly.',
                  style: AppStyles.style14Normal,
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Please try again later.',
                  style: AppStyles.style14Normal,
                  textAlign: TextAlign.center,
                ),
                Dimens.boxHeight16,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
