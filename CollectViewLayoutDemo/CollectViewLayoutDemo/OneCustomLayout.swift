//
//  OneCustomLayout.swift
//  ArKitDemo
//
//  Created by 623971951 on 2018/1/5.
//  Copyright © 2018年 syc. All rights reserved.
//

import UIKit

class OneCustomLayout: UICollectionViewLayout {
    
    // 总大小
    override var collectionViewContentSize: CGSize{
        let w = collectionView!.bounds.size.width - collectionView!.contentInset.left - collectionView!.contentInset.right
        
        let h = CGFloat(collectionView!.numberOfItems(inSection: 0) + 1) / 3 * (w/3*2)
        
        return CGSize(width: w, height: h)
    }
    
    // 单元格位置
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var arr = [UICollectionViewLayoutAttributes]()
        let cellCount = self.collectionView!.numberOfItems(inSection: 0)
        for i in 0 ..< cellCount{
            let indexPath = IndexPath(item: i, section: 0)
            let attributes = self.layoutAttributesForItem(at: indexPath)
            arr.append(attributes!)
        }
        return arr
    }
    
    //返回对应于indexPath的位置的cell的布局属性
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        
        //当前单元格布局属性
        let attribute =  UICollectionViewLayoutAttributes(forCellWith:indexPath)
        
        //单元格边长
        let largeCellSide = collectionViewContentSize.width / 3 * 2
        let smallCellSide = collectionViewContentSize.width / 3
        
        //当前行数，每行显示3个图片，1大2小
        let line:Int =  indexPath.item / 3
        //当前行的Y坐标
        let lineOriginY =  largeCellSide * CGFloat(line)
        //右侧单元格X坐标，这里按左右对齐，所以中间空隙大
        let rightLargeX = collectionViewContentSize.width - largeCellSide
        let rightSmallX = collectionViewContentSize.width - smallCellSide
        
        // 每行2个图片，2行循环一次，一共6种位置
        if (indexPath.item % 6 == 0) {
            attribute.frame = CGRect(x:0, y:lineOriginY, width:largeCellSide,
                                     height:largeCellSide)
        } else if (indexPath.item % 6 == 1) {
            attribute.frame = CGRect(x:rightSmallX, y:lineOriginY, width:smallCellSide,
                                     height:smallCellSide)
        } else if (indexPath.item % 6 == 2) {
            attribute.frame = CGRect(x:rightSmallX,
                                     y:lineOriginY + smallCellSide,
                                     width:smallCellSide, height:smallCellSide)
        } else if (indexPath.item % 6 == 3) {
            attribute.frame = CGRect(x:0, y:lineOriginY, width:smallCellSide,
                                     height:smallCellSide )
        } else if (indexPath.item % 6 == 4) {
            attribute.frame = CGRect(x:0,
                                     y:lineOriginY + smallCellSide,
                                     width:smallCellSide, height:smallCellSide)
        } else if (indexPath.item % 6 == 5) {
            attribute.frame = CGRect(x:rightLargeX, y:lineOriginY,
                                     width:largeCellSide,
                                     height:largeCellSide)
        }
        
        return attribute
    }
    
}
