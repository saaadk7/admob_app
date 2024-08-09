import 'package:flutter/cupertino.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'dart:io';

class AdDisplay {
  final adUnitId = Platform.isAndroid
  //for android 
      ? 'ca-app-pub-3696635570112837/5903982924'

       // for ios 
       
      : 'ca-app-pub-3696635570112837/5903982924';

  void displayBannerAd(BannerAd? bannerAd, State myHomePageState) {
    bannerAd = BannerAd(
      adUnitId: adUnitId,
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          print('$ad loaded.');
          myHomePageState.setState(() {});
        },
        onAdFailedToLoad: (ad, err) {
          print('Banner Ad Failed to Load: $err');
          ad.dispose();
        },
      ),
    )..load();
  }
}
