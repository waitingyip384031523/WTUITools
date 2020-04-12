#
# Be sure to run `pod lib lint WTUITools.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'WTUITools'
  s.version          = '1.0.2'
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
  
  s.default_subspec = 'Core'
  
  s.resource_bundles = {
    'WTUITools' => ['WTUITools/Assets/*.png']
  }
  
  s.subspec 'Core' do |core|
      core.dependency 'WTUITools/BadgeView'
      core.dependency 'WTUITools/CALayer'
      core.dependency 'WTUITools/ChatMessageView'
      core.dependency 'WTUITools/FlowLayout'
      core.dependency 'WTUITools/TagView'
      core.dependency 'WTUITools/UIAlertController'
      core.dependency 'WTUITools/UIButton'
      core.dependency 'WTUITools/UIColor'
      core.dependency 'WTUITools/UIImage'
      core.dependency 'WTUITools/UILabel'
      core.dependency 'WTUITools/UINavigationbar'
      core.dependency 'WTUITools/UITabbarViewController'
      core.dependency 'WTUITools/UITableViewIndex'
      core.dependency 'WTUITools/UITextView'
      core.dependency 'WTUITools/UIView'
      core.dependency 'WTUITools/UIWindow'
  end
  
  s.subspec 'BadgeView' do |bdgView|
      bdgView.source_files = 'WTUITools/Classes/BadgeView/*.{h,m}'
  end

  s.subspec 'CALayer' do |caLayer|
      caLayer.source_files = 'WTUITools/Classes/CALayer/*.{h,m}'
  end

  s.subspec 'ChatMessageView' do |cmView|
      cmView.source_files = 'WTUITools/Classes/ChatMessageView/*.{h,m}'
      cmView.dependency 'WTUITools/UIView'
      cmView.dependency 'WTUITools/UIImage'
  end

  s.subspec 'FlowLayout' do |fl|
      fl.source_files = 'WTUITools/Classes/FlowLayout/*.{h,m}'
  end

  s.subspec 'TagView' do |tg|
      tg.source_files = 'WTUITools/Classes/TagView/*.{h,m}'
  end

  s.subspec 'UIAlertController' do |alertController|
      alertController.source_files = 'WTUITools/Classes/UIAlertController/*.{h,m}'
  end

  s.subspec 'UIButton' do |button|
      button.source_files = 'WTUITools/Classes/UIButton/*.{h,m}'
      button.dependency 'WTUITools/UIImage'
  end

  s.subspec 'UIColor' do |color|
      color.source_files = 'WTUITools/Classes/UIColor/*.{h,m}'
  end

  s.subspec 'UIImage' do |image|
      image.source_files = 'WTUITools/Classes/UIImage/*.{h,m}'
      image.dependency 'WTUITools/UIColor'
  end

  s.subspec 'UILabel' do |label|
      label.source_files = 'WTUITools/Classes/UILabel/*.{h,m}'
  end

  s.subspec 'UINavigationbar' do |nav|
      nav.source_files = 'WTUITools/Classes/UINavigationbar/*.{h,m}'
  end

  s.subspec 'UITabbarViewController' do |tb|
      tb.source_files = 'WTUITools/Classes/UITabbarViewController/*.{h,m}'
      tb.dependency 'WTUITools/UIButton'
  end

  s.subspec 'UITableViewIndex' do |tbi|
      tbi.source_files = 'WTUITools/Classes/UITableViewIndex/*.{h,m}'
  end

  s.subspec 'UITextView' do |textView|
      textView.source_files = 'WTUITools/Classes/UITextView/*.{h,m}'
  end

  s.subspec 'UIView' do |view|
      view.source_files = 'WTUITools/Classes/UIView/*.{h,m}'
  end

  s.subspec 'UIWindow' do |window|
      window.source_files = 'WTUITools/Classes/UIWindow/*.{h,m}'
  end

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
