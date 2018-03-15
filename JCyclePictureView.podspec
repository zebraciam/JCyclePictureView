Pod::Spec.new do |s|

  s.name         = "JCyclePictureView"
  s.version      = "1.0.2"
  s.summary      = "用 UICollectionView 写的无限滚动轮播图，支持自定义 cell、滚动方向等。"

  s.homepage     = "https://github.com/GitHubZebra/JCyclePictureView"

  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author       = { "Zebra" => "mr_banma@126.com" }

  s.source       = { :git => "https://github.com/GitHubZebra/JCyclePictureView.git", :tag => s.version }

  s.source_files  = "JCyclePictureView/*.swift"

  s.ios.deployment_target = "9.0"
  s.requires_arc = true

  s.dependency "Kingfisher"

  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '4.0' }

end
