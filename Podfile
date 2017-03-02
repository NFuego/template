# Uncomment this line to define a global platform for your project
# platform :ios, '9.0'

target 'SuccessfulOrigami' do
  # Comment this line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!
  post_install do |installer|
      installer.pods_project.targets.each do |target|
          target.build_configurations.each do |config|
          config.build_settings['SWIFT_VERSION'] = '3.0'
      end
    end
  end


  # Pods for ShenZou
  pod 'Firebase/Core'
  pod 'Firebase/AdMob'
  pod 'CarouselSwift'
  pod 'SwiftIconFont'
  pod 'RxBluetoothKit' # use the customized version
  pod 'SwiftyTimer'
  pod 'SwiftyUserDefaults'
#  pod 'Charts'
  pod 'SnapKit'
  pod 'RxCocoa'
  #pod 'NSObject+Rx'
  pod 'SlideMenuControllerSwift'
  pod 'RxAlamofire'
  pod 'SwiftyJSON'
# pod 'SwiftString3', '~> 1.0'
  pod 'Brick'
  pod 'Moya', '8.0.0-beta.6'
  pod 'Moya/RxSwift'
  pod 'XCGLogger', '~> 4.0.0'
  pod 'Typhoon'




end
