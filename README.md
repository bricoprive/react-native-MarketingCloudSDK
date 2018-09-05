
# react-native-marketing-cloud-sdk

## Getting started

`$ npm install react-native-marketing-cloud-sdk --save`

### Mostly automatic installation

`$ react-native link react-native-marketing-cloud-sdk`

### Manual installation


#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-marketing-cloud-sdk` and add `RNMarketingCloudSdk.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRNMarketingCloudSdk.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<

#### Android

1. Open up `android/app/src/main/java/[...]/MainActivity.java`
  - Add `import com.danielferro.marketingcloudsdk.RNMarketingCloudSdkPackage;` to the imports at the top of the file
  - Add `new RNMarketingCloudSdkPackage()` to the list returned by the `getPackages()` method
2. Append the following lines to `android/settings.gradle`:
  	```
  	include ':react-native-marketing-cloud-sdk'
  	project(':react-native-marketing-cloud-sdk').projectDir = new File(rootProject.projectDir, 	'../node_modules/react-native-marketing-cloud-sdk/android')
  	```
3. Insert the following lines inside the dependencies block in `android/app/build.gradle`:
  	```
      compile project(':react-native-marketing-cloud-sdk')
  	```


## Usage
```javascript
import RNMarketingCloudSdk from 'react-native-marketing-cloud-sdk';

// TODO: What to do with the module?
RNMarketingCloudSdk;
```
  