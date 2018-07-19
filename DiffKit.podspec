#
#  Be sure to run `pod spec lint DiffKit.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "DiffKit"
  s.version      = "0.0.1"
  s.summary      = "Declarative UIKit Extensions"
  s.description  = <<-DESC
                   UIKit extensions that allow you to declare your view hierarchy with automatic diffing.
                   DESC
  s.homepage     = "https://github.com/SendOutCards/DiffKit"
  s.license      = "MIT"

  s.author             = { "Brad Hilton" => "brad.hilton.nw@gmail.com" }
  s.social_media_url   = "https://twitter.com/bradthilton"

  s.ios.deployment_target     = "11.0"
  s.watchos.deployment_target = "4.0"
  s.tvos.deployment_target    = "11.0"

  s.source = { :git => "https://github.com/SendOutCards/DiffKit.git", :tag => "0.0.1" }

  s.source_files  = "DiffKit", "DiffKit/**/*.{h,m,swift}"

end
