//
//  SearchResultViewController.swift
//  Group1_OnlineBookStore
//
//  Created by VoYen on 2022-05-23.
//  Copyright © 2022 Huynh Thu. All rights reserved.
//

import UIKit

class SearchResultViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        books.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = (collectionView.dequeueReusableCell(withReuseIdentifier: bookYCollectionViewCell, for: indexPath) as? BookYCollectionViewCell)!
        let book = books[indexPath.row]
        cell.img.image = UIImage(named: "XuXu")
        return cell
    }
    
    
    

    
    
let bookYCollectionViewCell = "BookYCollectionViewCell"
   var books = [Book]()
   
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
       let nilCell = UINib(nibName: bookYCollectionViewCell, bundle: nil)
        collectionView.register(nilCell, forCellWithReuseIdentifier: bookYCollectionViewCell)
        
    
       
        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
