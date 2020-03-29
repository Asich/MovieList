//
//  SearchViewController.swift
//  MovieList
//
//  Created by Ainur on 3/29/20.
//  Copyright © 2020 Ainur. All rights reserved.
//

import Foundation
import UIKit

class SearchViewController: UIViewController {
    
    let mov = ["test", "test2", "test3"]
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    
    
   
}


extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return mov.count
       }
       
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = tableView.dequeueReusableCell(withIdentifier: "searchCell", for: indexPath) as! SearchTableViewCell
           cell.title.text = mov[indexPath.row]
           return cell
       }
}
