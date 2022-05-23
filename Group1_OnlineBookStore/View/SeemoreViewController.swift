//
//  SeemoreViewController.swift
//  Group1_OnlineBookStore
//
//  Created by VoYen on 2022-05-23.
//  Copyright © 2022 Huynh Thu. All rights reserved.
//

import UIKit

class SeemoreViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return books.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? BookYCollectionViewCell{
            let book = books[indexPath.row]
            
            if let url = URL(string: book.slug){
                let task = URLSession.shared.dataTask(with: url, completionHandler: {data, _, error in
                    guard let data = data, error == nil else{
                        return
                    }
                    
                    DispatchQueue.main.async{
                        
                        let img = UIImage(data: data)
                        cell.img.image = img
                    }
                })
                task.resume()
            }
            //            cell.img.image = book.slug
            cell.lblName.text = book.name
            cell.lblPrice.text = String(book.price)
            
            return cell
        }else{
            fatalError("Can not create the cell")
        }
    }
    
let identifier = "BookYCollectionViewCell"
    var books = [Book]()
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
books = SaveData.bookModel.books
        collectionView.delegate = self
           collectionView.dataSource = self
        
           // register nib file for collection view cell
           collectionView.register(UINib(nibName: "BookYCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: identifier)
        self.title = "All Book"
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
extension SeemoreViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width / 3 - 10, height: 250)
    }
}
