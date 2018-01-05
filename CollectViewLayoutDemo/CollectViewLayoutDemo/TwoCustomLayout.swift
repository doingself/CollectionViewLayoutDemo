//
//  TwoCustomLayout.swift
//  ArKitDemo
//
//  Created by 623971951 on 2018/1/5.
//  Copyright © 2018年 syc. All rights reserved.
//

import UIKit

class TwoCustomLayout: UICollectionViewFlowLayout {
    
    private lazy var attrs:[UICollectionViewLayoutAttributes] = [UICollectionViewLayoutAttributes]()
    private let cols = 3
    private lazy var heights:[CGFloat] = Array(repeating: self.sectionInset.top, count: self.cols)
    private var startIndex:Int = 0

    
    override var collectionViewContentSize: CGSize{
        return CGSize(width: 0, height: heights.max()! + sectionInset.bottom)
    }
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return attrs
    }
    //预布局方法 所有的布局应该写在这里面
    override func prepare() {
        super.prepare()
        
        //item个数
        let itemCount = collectionView!.numberOfItems(inSection: 0)
        let itemW:CGFloat = (collectionView!.bounds.size.width - sectionInset.left - sectionInset.right - minimumInteritemSpacing*CGFloat(cols - 1))/CGFloat(cols)
        
        //创建指定个数的atts
        for i in startIndex..<itemCount {
            //计算indexPath
            let indexPath = IndexPath(item: i, section: 0)
            //创建atts
            let attr = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            
            // cell 高度
            let itemH: CGFloat = CGFloat(arc4random_uniform(300))
            
            let height = heights.min()!
            let index = heights.index(of: height)!
            
            let itemX = sectionInset.left + (itemW + minimumInteritemSpacing)*CGFloat(index)
            
            let itemY:CGFloat = height + minimumLineSpacing
            
            //设置attr的frame
            attr.frame = CGRect(x: itemX, y: itemY, width: itemW, height: itemH)
            
            //保存heights
            heights[index] = height + minimumLineSpacing + itemH
            //保存frame
            attrs.append(attr)
        }
        //记录当前最大的count
        startIndex = itemCount
    }
}
