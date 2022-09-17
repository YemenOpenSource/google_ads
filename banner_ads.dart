 import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'ads.dart';

class AdBanner extends StatefulWidget {
    const AdBanner({Key? key,
       this.width,
       this.height}) : super(key: key);
   final int? width;
   final int? height;

   @override
   State<AdBanner> createState() => _AdBannerState();
 }

 class _AdBannerState extends State<AdBanner> {
 late BannerAd bannerAd;
  bool isReady=false;


  @override
  initState(){
    super.initState();
    createBannerAd();
  }
 createBannerAd(){
   bannerAd= BannerAd(
     size: (widget.width!=null&&widget.height!=null)?
     AdSize(width:widget.width??0 ,height: widget.height??0):AdSize.mediumRectangle,
     request: const AdRequest(),
     adUnitId: AdsId.bannerAdUnitId,
     listener:  BannerAdListener(
       // Called when an ad is successfully received.
       onAdLoaded: (Ad ad) => setState(() {
         isReady=true;
       }),
       // Called when an ad request failed.
       onAdFailedToLoad: (Ad ad, LoadAdError error) {
         // Dispose the ad here to free resources.
         ad.dispose();
         debugPrint('Ad failed to load: $error');
       },
       // Called when an ad opens an overlay that covers the screen.
       onAdOpened: (Ad ad) => debugPrint('Ad opened.'),
       // Called when an ad removes an overlay that covers the screen.
       onAdClosed: (Ad ad) => debugPrint('Ad closed.'),
       // Called when an impression occurs on the ad.
       onAdImpression: (Ad ad) => debugPrint('Ad impression.'),
     ),
   );
   bannerAd.load();

 }

   @override
   Widget build(BuildContext context) {
     return      Container(
       alignment: Alignment.center,
       child: AdWidget(ad: bannerAd),
       width: bannerAd.size.width.toDouble(),
       height: bannerAd.size.height.toDouble(),
     );
   }
 }
