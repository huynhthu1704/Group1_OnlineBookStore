//
//  SeemoreViewController.swift
//  Group1_OnlineBookStore
//
//  Created by VoYen on 2022-05-17.
//  Copyright © 2022 Huynh Thu. All rights reserved.
//

import UIKit

class SeemoreViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource{
 
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return books.count
    }
  
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//       let cell = collectionView.register(UNib(nibName: SeemoreCollectionViewCell,bundle : nil),forCellWithReuseIdentifier: "SeemoreCollectionViewCell")
//        cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SeemoreCollection ViewCell", for: indexPath) as! SeemoreCollectionViewCell
//            let book = books[indexPath.row]
//            cell.img.image = book.slug
//            cell.lblName.text = book.name
//            return cell
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SeemoreCollectionViewCell", for: indexPath) as? SeemoreCollectionViewCell{
            let book = books[indexPath.row]
            cell.img.image = book.slug
            cell.lblName.text = book.name
            return cell
        }else{
            fatalError("can't create the cell")
        }
    }
    

    @IBOutlet weak var collectionView: UICollectionView!
    let seemoreCollectionViewCell = "SeemoreCollectionViewCell"
    var books = [Book]()
    override func viewDidLoad() {
        super.viewDidLoad()
let nibCell = UINib(nibName: seemoreCollectionViewCell, bundle: nil)
        collectionView.register(nibCell, forCellWithReuseIdentifier: seemoreCollectionViewCell)
        for _ in 1...8{
            let book = Book(id: "12", name: "Xu xu dung khoc", author: "Hong sakura", publisher: "Hoi nha van", price: 123, quantity: 123, totalSold: 321, slug: UIImage(named: "XuXu"), summary: "dsfd", category: "fdfd")
            books.append(book)
        }
        collectionView.reloadData()
//        collectionView.delegate = self
//        collectionView.dataSource = self
//        let book = Book(id: "12", name: "Xu xu dung khoc", author: "Hong sakura", publisher: "Hoi nha van", price: 123, quantity: 123, totalSold: 321, slug: UIImage(named: "XuXu"), summary: "dsfd", category: "fdfd")
//        for _ in 0...8{
//            books.append(book)
//        }
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

