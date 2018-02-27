#
#  Be sure to run `pod spec lint MKShow.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  #

  s.name         = "MKShow"
  s.version      = "1.0.0"
  s.summary      = "这是一个公共的类库你可以下载应用到你的系统中"

  s.description  = <<-DESC
A general pop-up box, pop-up references to third-party libraries of Masonry and system library UIKit the pop-up box has a variety of display style.
                    DESC

  s.platform = :ios, "9.0"

  s.homepage     = "https://github.com/jxcz94754/MKShow"

  s.license      = "MIT"

  s.author       = { "Mark" => "1032325795@qq.com" }

  s.source       = { :git => "https://github.com/jxcz94754/MKShow.git", :tag => "1.0.0" }

  s.ios.deployment_target = '9.0'

  s.frameworks = "UIKit"
  s.frameworks = "Foundation"
  s.dependency 'Masonry'
  s.source_files  = "MarkShow/MK/*.{h,m}"

  s.requires_arc = true

end
