//
//  ViewController.swift
//  XReusable
//
//  Created by Ray on 09/06/2022.
//  Copyright (c) 2022 Ray. All rights reserved.
//

import UIKit
import XReusable


class ViewController: UIViewController {

    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize.init(width: 100, height: 100)
        
        let view = UICollectionView.init(frame: .zero, collectionViewLayout: layout)
        view.xr.register(cell: ACell.self)
        view.delegate = self
        view.dataSource = self
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.frame = CGRect.init(x: 10, y: 40, width: 300, height: 300)
        view.addSubview(collectionView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension ViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: ACell = collectionView.xr.dequeueReusableCell(for: indexPath)
        return cell
    }
    
    
}

class ACell: UICollectionViewCell, XReusable {
    
}
