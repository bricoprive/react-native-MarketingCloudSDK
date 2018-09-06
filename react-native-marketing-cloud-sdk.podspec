
require 'json'
pjson = JSON.parse(File.read('package.json'))

Pod::Spec.new do |s|
  s.name             = "react-native-marketing-cloud-sdk"
  s.version          = pjson["version"]
  s.summary          = pjson["description"]
  s.requires_arc     = true
  s.author           = { 'Daniel Ferro' => 'dlcerva@gmail.com' }
  s.license          = pjson["license"]
  s.homepage         = 'https://github.com/dlferro/react-native-MarketingCloudSDK'
  s.source           = { :git => "https://github.com/dlferro/react-native-MarketingCloudSDK.git" }
  s.source_files     = 'RNMarketingCloudSDK/*'
  s.platform         = :ios, "9.0"
  s.dependency 'MarketingCloudSDK'
  s.dependency 'React'
end
