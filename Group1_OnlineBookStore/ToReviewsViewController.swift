//
//  ToReviewsViewController.swift
//  Group1_OnlineBookStore
//
//  Created by Pham Van Thanh on 2022-05-20.
//  Copyright © 2022 Huynh Thu. All rights reserved.
//

import UIKit

class ToReviewsViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var ToReviewBookTableView: UITableView!
    var books = [Book]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ToReviewBookTableView.dataSource = self
        ToReviewBookTableView.delegate = self
        let book = Book(id: "1", name: "The Old Man and The Sea", author: "Author 1", publisher: "Ha Noi", price: 11, quantity: 15, totalSold: 14, slug: UIImage(named: "TheOldManAndTheSea"), summary: "x", category: "x")
        let book1 = Book(id: "2", name: "Neo Ve Cua Y", author: "Author 2", publisher: "Ha Noi Publishing company", price: 13, quantity: 15, totalSold: 14, slug: UIImage(named: "NeoVeCuaY"), summary: "x", category: "x")
        let book2 = Book(id: "3", name: "Lord Of The Flies", author: "Author 2", publisher: "TPHCM Publishing company", price: 13, quantity: 15, totalSold: 14, slug: UIImage(named: "LordOfTheFlies"), summary: "x", category: "x")
        let book3 = Book(id: "4", name: "Animal Farm", author: "Author 2", publisher: "Nhi Dong Publishing company", price: 13, quantity: 15, totalSold: 14, slug: UIImage(named: "AnimalFarm"), summary: "x", category: "x")
        books.append(book)
        books.append(book1)
        books.append(book2)
        books.append(book3)
        books.append(book2)
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reuseIndentifier = "ToReviewBookTableViewCell"
        var cell: ToReviewBookTableViewCell! = tableView.dequeueReusableCell(withIdentifier: reuseIndentifier) as? ToReviewBookTableViewCell
        if cell == nil {
            tableView.register(UINib(nibName: "ToReviewBookTableViewCell", bundle: nil), forCellReuseIdentifier: reuseIndentifier)
            cell = tableView.dequeueReusableCell(withIdentifier: reuseIndentifier) as? ToReviewBookTableViewCell
        }
        let book = books[indexPath.row]
        cell.imageBook.image = book.slug
        cell.lblBookNameAuthor.text = "\(book.name) - \(book.author)"
        cell.lblBookPuslishingCompany.text = book.publisher
        cell.book = book
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let writeReviewScreen = WriteReviewViewController(nibName: "WriteReviewViewController", bundle: nil)
        //        self.present(viewAllOrdersController, animated: true, completion: nil)
        writeReviewScreen.navigationItem.title = "Write review"
        writeReviewScreen.book = books[indexPath.row]
        navigationController?.pushViewController(writeReviewScreen, animated: true)
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
