//
//  ViewController.swift
//  SciChartDemo
//
//  Created by Admin on 04/03/2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
    @IBOutlet weak var collectionView: UICollectionView!
    var models = [ChartModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        models = ChartDataProvider.createModels(count: 10)
        collectionView.reloadData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        models.removeAll()
        collectionView.reloadData()
    }
}

extension ViewController : UICollectionViewDataSource, UICollectionViewDelegate {
  
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let chartCell = collectionView.dequeueReusableCell(withReuseIdentifier: ChartCollectionCell.ReuseIdentifier, for: indexPath) as? ChartCollectionCell {
            let model = models[indexPath.row]
            chartCell.header.text = model.title
            chartCell.initialize()
            return chartCell
        }
        
        return UICollectionViewCell()
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
}


struct ChartModel {
    let id : Int
    let title : String
}

