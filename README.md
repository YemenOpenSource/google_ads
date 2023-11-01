[![StandWithPalestine](https://raw.githubusercontent.com/TheBSD/StandWithPalestine/main/badges/StandWithPalestine.svg)](https://github.com/TheBSD/StandWithPalestine/blob/main/docs/README.md)

![Google Ads](https://user-images.githubusercontent.com/83473041/191724895-7ed7f336-7c39-4d30-b76b-ac50322a3b0f.png)

# Google Ads

An easy way to add all google ads to your flutter app.

## How to use it

1. Add the google_mobile_ads package using `flutter pub add google_mobile_ads`.

2. Update your Info.plist as follows:

```
<key>GADApplicationIdentifier</key>
<string>ca-app-pub-3940256099942544~1458002511</string>
<key>SKAdNetworkItems</key>
  <array>
    <dict>
      <key>SKAdNetworkIdentifier</key>
      <string>cstr6suwn9.skadnetwork</string>
    </dict>
  </array>
```

3. Add the AdMob App ID (identified in the AdMob UI) to the app's `android/app/src/main/AndroidManifest.xml`

```
<manifest>
    <application>
<!--  Sample AdMob App ID: ca-app-pub-3940256099942544~3347511713 -->
        <meta-data
        android:name="com.google.android.gms.ads.APPLICATION_ID"
        android:value="ca-app-pub-xxxxxxxxxxxxxxxx~yyyyyyyyyy"/>
    </application>
</manifest>
```

4) Add id's of `(rewardedID &&interstitialID && bannerID)` in ads.dart inside `if(kReleaseMode)`.

5) To use banner just write `AdBanner()` inside any widget.

6) To use rewarded just write `AdReWarded.instance.createRewardedAd()` inside `initState()` method and write `AdReWarded.instance.dispose` inside `dispose()` method.

7) To use interstitial just write `AdInterstitial.instance.createInterstitialAd()` inside `initState()` method and write `AdInterstitial.instance.dispose` inside `dispose()` method.
