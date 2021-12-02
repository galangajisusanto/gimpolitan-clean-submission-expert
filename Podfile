# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

source 'https://github.com/galangajisusanto/Gimpolitan-Corepodspec'

use_frameworks!

workspace 'Modularization'

  target 'gimpolitan-clean-submission-expert' do
    # Pods for gimpolitan-clean-submission-expert
    pod 'SwiftLint'
    pod 'Alamofire', '~> 5.4'
    pod 'RxSwift', '6.2.0'
    pod 'RxCocoa', '6.2.0'
    pod 'SDWebImage', '~> 5.0'
    pod 'RealmSwift', '~>10'

  target 'Game' do
    project '../Game/Game'
  end

  target 'Favorite' do
    project '../favorite/Favorite'
  end

  pod 'Core'

  target 'Common' do
    project '../Common/Common'
  end

  target 'gimpolitan-clean-submission-expertTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'gimpolitan-clean-submission-expertUITests' do
    # Pods for testing
  end

end
