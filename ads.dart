import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdsId {


  static String get bannerAdUnitId {
    if(!kReleaseMode){
     return 'ca-app-pub-3913023747349489/8836596620';
    }
    else{
      return Platform.isAndroid
          ? 'ca-app-pub-3940256099942544/6300978111'
          : 'ca-app-pub-3940256099942544/2934735716';
    }

  }

  static String get interstitialAdUnitId {
    if(!kReleaseMode){
    return "ca-app-pub-3913023747349489/6453975865";
    }
    else{
      return
        Platform.isAndroid
            ? 'ca-app-pub-3940256099942544/1033173712'
            : 'ca-app-pub-3940256099942544/4411468910';
    }

  }

  static String get rewardedAdUnitId {
    if(!kReleaseMode){
      return "ca-app-pub-3913023747349489/7290461108";
    }
    else{
      return
        Platform.isAndroid
            ? 'ca-app-pub-3940256099942544/5224354917'
            : 'ca-app-pub-3940256099942544/1712485313';
    }

  }
}
