//
//
// import 'package:google_mobile_ads/google_mobile_ads.dart';
//
// import 'ads.dart';
//
// class AdReWarded{
//   AdReWarded._();
//   RewardedAd? _rewardedAd;
//   int _numRewardedLoadAttempts = 0;
//   int maxFailedLoadAttempts = 3;
//
//   static AdReWarded instance=AdReWarded._();
//   void createRewardedAd() {
//     RewardedAd.load(
//         adUnitId:AdsId.rewardedAdUnitId,
//         request:  const AdRequest(),
//         rewardedAdLoadCallback: RewardedAdLoadCallback(
//           onAdLoaded: (RewardedAd ad) {
//             print('$ad loaded.');
//             _rewardedAd = ad;
//             _numRewardedLoadAttempts = 0;
//             _showRewardedAd();
//           },
//           onAdFailedToLoad: (LoadAdError error) {
//             print('RewardedAd failed to load: $error');
//             _rewardedAd = null;
//             _numRewardedLoadAttempts += 1;
//             if (_numRewardedLoadAttempts < maxFailedLoadAttempts) {
//               createRewardedAd();
//             }
//           },
//         ));
//   }
//
//   void _showRewardedAd() {
//     if (_rewardedAd == null) {
//       print('Warning: attempt to show rewarded before loaded.');
//       return;
//     }
//     _rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
//       onAdShowedFullScreenContent: (RewardedAd ad) =>
//           print('ad onAdShowedFullScreenContent.'),
//       onAdDismissedFullScreenContent: (RewardedAd ad) {
//         print('$ad onAdDismissedFullScreenContent.');
//         ad.dispose();
//         createRewardedAd();
//       },
//       onAdFailedToShowFullScreenContent: (RewardedAd ad, AdError error) {
//         print('$ad onAdFailedToShowFullScreenContent: $error');
//         ad.dispose();
//         createRewardedAd();
//       },
//     );
//
//     _rewardedAd!.setImmersiveMode(true);
//     _rewardedAd!.show(
//         onUserEarnedReward: (AdWithoutView ad, RewardItem reward) {
//           print('$ad with reward $RewardItem(${reward.amount}, ${reward.type})');
//         });
//     _rewardedAd = null;
//   }
//   void dispose() {
//     _rewardedAd?.dispose();
//   }
// }