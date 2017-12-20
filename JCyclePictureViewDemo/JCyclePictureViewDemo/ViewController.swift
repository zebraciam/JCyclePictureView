//
//  ViewController.swift
//  JCyclePictureViewDemo
//
//  Created by Zebra on 2017/12/20.
//  Copyright © 2017年 Zebra. All rights reserved.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {

    let pictures: [String] = ["http://pic29.nipic.com/20130512/12428836_110546647149_2.jpg", "picture2", "picture3", "picture4", "picture5", "http://pic29.nipic.com/20130512/12428836_110546647149_2.jpg", "picture7"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.createCyclePicture1()
        
        self.createCyclePicture2()
    }
    
    func createCyclePicture1() {

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
//        cyclePictureView.pageControl.currentPageIndicatorTintColor
//        cyclePictureView.pageControl.currentPageIndicatorImage
        
        // 默认圆点
//        cyclePictureView.pageControl.pageIndicatorTintColor
//        cyclePictureView.pageControl.pageIndicatorImage

        // 点击回调
        cyclePictureView.didTapAtIndexHandle = { index in
            
            print("点击了第 \(index + 1) 张图片")
        }
        
        self.view.addSubview(cyclePictureView)
    }
    
    func createCyclePicture2() {
        
        let cyclePictureView: JCyclePictureView = JCyclePictureView(frame: CGRect(x: 0, y: 200, width: self.view.frame.width, height: 150), pictures: pictures)
        
        // 滚动方向
        cyclePictureView.direction = .right
        
        // 自动滚动时间
        cyclePictureView.autoScrollDelay = 5
        
        cyclePictureView.titles = ["标题1", "标题2", "标题3", "标题4", "标题5", "标题6", "标题7"]
        
        // 点击回调
        cyclePictureView.didTapAtIndexHandle = { index in
            
            print("点击了第 \(index + 1) 张图片")
        }
        
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
//        cyclePictureView.register(<#T##nibs: [UINib?]##[UINib?]#>, identifiers: <#T##[String]#>, customCellHandle: <#T##JCyclePictureViewCustomCellHandle##JCyclePictureViewCustomCellHandle##(UICollectionView, IndexPath) -> UICollectionViewCell#>)
        
        self.view.addSubview(cyclePictureView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

class CustomCell: UICollectionViewCell {
    
    let imageView: UIImageView = UIImageView()
    
    let label: UILabel = UILabel()

    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        imageView.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
        
        label.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
        
        self.addSubview(imageView)
        
        self.addSubview(label)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

