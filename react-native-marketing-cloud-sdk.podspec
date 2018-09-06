Pod::Spec.new do |s|
  s.name             = "react-native-marketing-cloud-sdk"
  s.version          = "0.0.1"
  s.summary          = "React Native wrapper for Salesforce Marketing Cloud SDK"
  s.requires_arc = true
  s.author       = { 'Daniel Ferro' => 'dlcerva@gmail.com' }
  s.license      = 'MIT'
  s.homepage     = 'https://github.com/dlferro/react-native-MarketingCloudSDK'
  s.source       = { :git => "https://github.com/dlferro/react-native-MarketingCloudSDK.git" }
  s.source_files = 'RNMarketingCloudSDK/*'
  s.platform     = :ios, "9.0"
  s.dependency 'MarketingCloudSDK'
  s.dependency 'React'
end
