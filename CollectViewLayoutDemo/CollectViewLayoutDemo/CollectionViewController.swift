//
//  CollectionViewController.swift
//  ArKitDemo
//
//  Created by 623971951 on 2018/1/5.
//  Copyright © 2018年 syc. All rights reserved.
//

import UIKit

class CollectionViewController: UIViewController {

    private var collectView: UICollectionView!
    
    private var layout1: UICollectionViewLayout = {
        return OneCustomLayout()
    }()
    private var layout2: UICollectionViewLayout = {
        return TwoCustomLayout()
    }()
    private var layout3: UICollectionViewFlowLayout!
    
    private let cellIdentifier = "collectionCell"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.title = "list"
        self.view.backgroundColor = UIColor.white
        
        let rightOneBtn = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.refresh, target: self, action: #selector(self.switchStyle(sender:)))
        let rightTwoBtn = UIBarButtonItem(title: "style2", style: UIBarButtonItemStyle.plain, target: self, action: #selector(self.switchStyle(sender:)))
        let rightThreeBtn = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.add, target: self, action: #selector(self.switchStyle(sender:)))
        rightOneBtn.tag = 1
        rightTwoBtn.tag = 2
        rightThreeBtn.tag = 3
        self.navigationItem.rightBarButtonItems = [rightOneBtn, rightTwoBtn, rightThreeBtn]
        
        layout3 = UICollectionViewFlowLayout()
        layout3.itemSize = CGSize(width: (self.view.bounds.size.width/2-20), height: 200)
        
        
        
        collectView = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout3)
        self.view.addSubview(collectView)
        
        collectView.delegate = self
        collectView.dataSource = self
        collectView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellIdentifier)
        collectView.backgroundColor = UIColor.clear
    }
    
    @objc func switchStyle(sender: UIBarButtonItem){
        let tag = sender.tag
        // 切换布局
        if tag == 1{
            collectView.setCollectionViewLayout(layout1, animated: true)
        }else if tag == 2{
            collectView.setCollectionViewLayout(layout2, animated: true)
        }else {
            collectView.setCollectionViewLayout(layout3, animated: true)
        }
        // 滚动到头部
        collectView.scrollToItem(at: IndexPath(item: 0, section: 0), at: UICollectionViewScrollPosition.top, animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
extension CollectionViewController: UICollectionViewDataSource{
    // MARK: collection view data source
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 27
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath)
        cell.backgroundColor = UIColor.randomColor()
        return cell
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
}
extension CollectionViewController: UICollectionViewDelegateFlowLayout{
    // MARK: collection view delegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
//        let sb = UIStoryboard(name: "Main", bundle: nil)
//        let v: UIViewController = sb.instantiateViewController(withIdentifier: "ViewController")
//        self.navigationController?.pushViewController(v, animated: true)
    }
    
    // MARK: collection view delegate flow layout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
}

extension UIColor{
    // 随机颜色
    class func randomColor() -> UIColor{
        let r = CGFloat(arc4random_uniform(256))/255
        let g = CGFloat(arc4random_uniform(256))/255
        let b = CGFloat(arc4random_uniform(256))/255
        
        return UIColor(red: r, green: g, blue: b, alpha: 1.0)
    }
}
