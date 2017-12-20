# Swift图片轮播 JCyclePictureView
用 UICollectionView 写的无限滚动轮播图，支持自定义 cell、滚动方向等。

## CocoaPods

* 支持CocoaPods
 
```ruby
pod 'JCyclePictureView' 
```
<!--注意：在pod install的时候，比较慢(可能网速问题)，如果在pod update的时候就比较快了，此无解。-->

## Usage
```swift
let cyclePictureView: JCyclePictureView = JCyclePictureView(frame: CGRect(x: 0, y: 20, width: self.view.frame.width, height: 150), pictures: pictures)
        
// 滚动方向
cyclePictureView.direction = .left
        
// 自动滚动时间
cyclePictureView.autoScrollDelay = 3
        
// pageControl 位置
cyclePictureView.pageControlStyle = .center
        
// 默认显示图
cyclePictureView.placeholderImage = #imageLiteral(resourceName: "picture1")
        
// 高亮圆点
cyclePictureView.pageControl.currentPageIndicatorTintColor
cyclePictureView.pageControl.currentPageIndicatorImage
        
// 默认圆点
cyclePictureView.pageControl.pageIndicatorTintColor
cyclePictureView.pageControl.pageIndicatorImage

// 点击回调
cyclePictureView.didTapAtIndexHandle = { index in
            
    print("点击了第 \(index + 1) 张图片")
}
        
self.view.addSubview(cyclePictureView)
```
