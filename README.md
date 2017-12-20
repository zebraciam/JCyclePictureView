# Swift图片轮播 JCyclePictureView
用 UICollectionView 写的无限滚动轮播图，支持自定义 cell、滚动方向等。

[![License](https://img.shields.io/cocoapods/l/JCyclePictureView.svg?style=flat)](http://cocoapods.org/pods/JCyclePictureView)
[![Platform](https://img.shields.io/cocoapods/p/JCyclePictureView.svg?style=flat)](http://cocoapods.org/pods/JCyclePictureView)

<img src="https://github.com/GitHubZebra/JCyclePictureView/blob/master/1.gif" width="400" align="center">

## Issues
如果使用过程中，有什么问题欢迎issues。


## Swift4

Swift4 及以上版本

## CocoaPods

* 支持CocoaPods
 
```ruby
pod 'JCyclePictureView' 
```
<!--注意：在pod install的时候，比较慢(可能网速问题)，如果在pod update的时候就比较快了，此无解。-->

## Support

* 支持纯图片
* 支持文本图片结合
* 支持横向滚动
* 支持纵向滚动
* 支持手势滑动
* 支持点击回调
* 支持图片数据的延时加载
* 支持没有数据，占位图占位
* 支持本地图片显示及与网络图的混合显示
* 支持系统UIPageControl位置设置
* 支持纯文本
* 支持UIPageControl.currentPage图片修改样式

## Usage
```swift
// 数据源
let pictures: [String] = ["http://pic29.nipic.com/20130512/12428836_110546647149_2.jpg", "picture2", "picture3", "picture4", "picture5", "http://pic29.nipic.com/20130512/12428836_110546647149_2.jpg", "picture7"]

// 初始化
let cyclePictureView: JCyclePictureView = JCyclePictureView(frame: CGRect(x: 0, y: 20, width: self.view.frame.width, height: 150), pictures: pictures)

// 标题
cyclePictureView.titles = ["标题1", "标题2", "标题3", "标题4", "标题5", "标题6", "标题7"]
         
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

// 自定义 cell
cyclePictureView.register([CustomCell.self], identifiers: ["CustomCell"]) { (collectionView, indexPath, picture) -> UICollectionViewCell in
            
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as! CustomCell
            
    if picture.hasPrefix("http") {
                
        cell.imageView.kf.setImage(with: URL(string: picture), placeholder: nil)
                
    } else {
                
        cell.imageView.image = UIImage(named: picture)
    }
            
    cell.label.text = "自定义 cell"
            
    cell.label.textColor = UIColor.white
            
    return cell
}
        
// 自定义 nib cell
cyclePictureView.register(<#T##nibs: [UINib?]##[UINib?]#>, identifiers: <#T##[String]#>, customCellHandle: <#T##JCyclePictureViewCustomCellHandle##JCyclePictureViewCustomCellHandle##(UICollectionView, IndexPath) -> UICollectionViewCell#>)
```
## Example

示例代码见ViewController.swift

实现逻辑：http://www.jianshu.com/p/e13992f78aef

## Author

Zebra，mr_banma@126.com
