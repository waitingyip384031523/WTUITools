#
# Be sure to run `pod lib lint WTUITools.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'WTUITools'
  s.version          = '1.0.7'
  s.summary          = 'A short description of WTUITools.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/waitingyip384031523/WTUITools'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'waitingyip384031523@gmail.com' => 'waitingyip384031523@gmail.com' }
  s.source           = { :git => 'https://github.com/waitingyip384031523/WTUITools.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'WTUITools/Classes/**/*'
  
  s.resource_bundles = {
    'WTUITools' => ['WTUITools/Assets/*.png']
  }
  
  s.subspec 'UIImage' do |img|
      img.source_files = 'WTUITools/Classes/UIImage/*.{h,m}'
      img.dependency 'WTUITools/UIColor'
  end
  
  s.subspec 'UIColor' do |color|
      color.source_files = 'WTUITools/Classes/UIColor/*.{h,m}'
  end

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
   s.dependency 'ReactiveObjC'
end
