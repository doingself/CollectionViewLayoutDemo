# CollectionViewLayoutDemo

UIcollectionView 自定义布局及切换


## 系统默认 UICollectionViewLayout

```
layout3 = UICollectionViewFlowLayout()
layout3.itemSize = CGSize(width: (self.view.bounds.size.width/2-20), height: 200)
// layout3... 或者通过代理 UICollectionViewDelegateFlowLayout 方法去实现
```

## 自定义 UICollectionViewLayout

重写 `layoutAttributesForElements` 和 `layoutAttributesForItem` 设置 frame

## 自定义 UICollectionViewFlowLayout

重写 `prepare` 设置 frame


## 切换 Layout

```
if tag == 1{
    collectView.setCollectionViewLayout(layout1, animated: true)
}else if tag == 2{
    collectView.setCollectionViewLayout(layout2, animated: true)
}else {
    collectView.setCollectionViewLayout(layout3, animated: true)
}
```

# Requirements
+ Swift 4
+ iOS 10+
+ Xcode 9+

---

鸣谢

+ http://www.hangge.com/blog/cache/detail_1594.html
+ http://www.hangge.com/blog/cache/detail_591.html
+ https://www.cnblogs.com/tinych/p/6893074.html
