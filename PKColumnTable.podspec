#
# Be sure to run `pod lib lint PKColumnTable.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'PKColumnTable'
  s.version          = '0.1.3'
  s.summary          = 'UItable View with Column fields.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/kansaraprateek/PKColumnTable'
  s.screenshots     = 'http://www.prateekkansara.com/GitProjectImages/PKColumnTable/PKColumnTableNoScroll.png', 'http://www.prateekkansara.com/GitProjectImages/PKColumnTable/PKColumTableScroll.gif'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'kansaraprateek' => 'prateek@tagrem.com' }
  s.source           = { :git => 'https://github.com/kansaraprateek/PKColumnTable.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'PKColumnTable/Classes/**/*'
  
  # s.resource_bundles = {
  #   'PKColumnTable' => ['PKColumnTable/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
