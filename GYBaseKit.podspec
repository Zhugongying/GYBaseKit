
Pod::Spec.new do |spec|
  spec.name             = 'GYBaseKit'
  spec.version          = '0.1.0'
  spec.summary          = 'GYBaseKit'
  spec.homepage         = 'https://www.baidu.com'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'zhugy781' => 'zhugy781@163.com' }
  spec.source           = { :git => 'https://github.com/Zhugongying/GYBaseKit.git', :tag => spec.version.to_s }

  spec.platform = :ios,'9.0'
  spec.ios.deployment_target = '9.0'

  spec.exclude_files = 'GYBaseKit/GYBaseKit/info.plist'
  spec.requires_arc = true
  
  spec.source_files = 'GYBaseKit/GYBaseKit/**/*.{h,m}'
#  spec.public_header_files = 'SportsKit/SportsKit/**/*.h'
  
  spec.pod_target_xcconfig = {
      'ENABLE_BITCODE' => 'NO',
      'OTHER_LDFLAGS' => '$(inherited) -ObjC -all_load -l"icucore" ',
      'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES',
  }
  
  spec.libraries = 'icucore','sqlite3'
  
  spec.resource_bundles = {
      'GYBaseUIKit' => ['GYBaseKit/GYBaseKit/UIKit/UIKit.xcassets']
  }
  
  # spec.resource_bundles = {
  #   'GYBaseKit' => ['GYBaseKit/Assets/*.png']
  # }

  # spec.public_header_files = 'Pod/Classes/**/*.h'
  # spec.frameworks = 'UIKit', 'MapKit'
  # spec.dependency 'AFNetworking', '~> 2.3'
end
