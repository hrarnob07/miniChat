//
//  AvaterPickerViewController.swift
//  miniChat
//
//  Created by rtc hubs on 11/3/19.
//  Copyright © 2019 rtc hubs. All rights reserved.
//

import UIKit

class AvaterPickerViewController: UIViewController ,  UICollectionViewDelegate ,  UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{

    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var segmentControll: UISegmentedControl!
    
    var avaterType = AvaterType.dark
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self

        // Do any additional setup after loading the view.
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier :"avaterCell", for: indexPath) as? AvaterCell {
           cell.configureCell(index: indexPath.item , type: avaterType)
            return cell
        
        }
        
        return AvaterCell()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 28
    }

    @IBAction func backPressed(_ sender: Any) {
        
        dismiss(animated: true , completion: nil)
    }
    
    @IBAction func segmentControllValueChange(_ sender: Any) {
        
        if segmentControll.selectedSegmentIndex == 0 {
          print("dark")
           avaterType = AvaterType.dark
        
        }
        else {
            print("light")
            avaterType = AvaterType.light
        }
        
       // collectionView.dataSource = self
       // collectionView.delegate = self
        
        collectionView.reloadData()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var numberOfColums : CGFloat = 3
        if UIScreen.main.bounds.width > 300{
            numberOfColums = 4
        }
        
        let spaceBetweenCells : CGFloat = 10
        let padding : CGFloat = 40
        
        let cellDimention = ((collectionView.bounds.width - padding) - (numberOfColums - 1) * spaceBetweenCells) / numberOfColums
        
        return CGSize(width: cellDimention , height : cellDimention)
        
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if avaterType == .dark {
            
            UserDataService.instance.setAvaterName(avaterName : "dark\(indexPath.item)")
        
        }
        else{
            UserDataService.instance.setAvaterName(avaterName : "light\(indexPath.item)")

        }
        
        
        self.dismiss(animated: true, completion: nil)
    }
    
    

}
