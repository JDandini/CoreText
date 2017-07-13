#
# Be sure to run `pod lib lint VOCoreText.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'VOCoreText'
  s.version          = '0.1.0'
  s.summary          = 'Library to create a NSAttributedString in a easy way'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
This pod adds a layer to the NSAttributedString to make it comprensive and easy to use 
                       DESC

  s.homepage         = 'https://www.vincoorbis.com'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'jdandini' => 'javier.castaneda@vincoorbis.com' }
  s.source           = { :git => 'https://github.com/jdandini/VOCoreText.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/JDandini'
  s.ios.deployment_target = '9.0'
  s.source_files = 'VOCoreText/Classes/**/*'
  
  # s.resource_bundles = {
  #   'VOCoreText' => ['VOCoreText/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
