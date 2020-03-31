//
//  SearchViewController.swift
//  MovieList
//
//  Created by Ainur on 3/29/20.
//  Copyright © 2020 Ainur. All rights reserved.
//

import Foundation
import UIKit

class SearchViewController: UIViewController, UISearchBarDelegate {
    
    var movies = [Movie]()
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        searchBar.delegate = self
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.movies = []
        let query = searchBar.text ?? ""
        let encodedQuery = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        searchMovie(query: encodedQuery ?? "")
    }
    
    func fetchMovieDetails(id: String) {
        print("Im working actually")
        let session = URLSession.shared
        let url = URL(string: API.url + "/film/\(id)")!
        var request = URLRequest(url: url)
        request.setValue(API.key, forHTTPHeaderField: "x-rapidapi-key")
        
        let task = session.dataTask(with: request) { data, response, error in
            if error != nil || data == nil {
                print("Client error!")
                return
            }
            
            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                print("Server error!")
                return
            }
                              
            guard let data = data else {
                print("No data")
                return
            }
            
            do {
                let result = try JSONDecoder().decode(Movie.self, from: data)
                self.movies.append(result)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch {
                print("error \(error.localizedDescription)", error)
            }
                  
        }
        task.resume()
    }
    
    func searchMovie(query: String) {
        let session = URLSession.shared
        let url = URL(string: API.url + "/search/\(query)")!
        var request = URLRequest(url: url)
        request.setValue(API.key, forHTTPHeaderField: "x-rapidapi-key")

        let task = session.dataTask(with: request) { data, response, error in
            if error != nil || data == nil {
                print("Client error!")
                return
            }
            
            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                print("Server error!")
                return
            }
            
            guard let data = data else {
                print("No data")
                return
            }
            do {
                let result = try JSONDecoder().decode(SearchResult.self, from: data)
                for title in result.titles {
                   self.fetchMovieDetails(id: title.id)
               }
            } catch {
                print("error \(error.localizedDescription)")
            }
        }
        task.resume()
    }
    
    
   
}


extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return movies.count
       }
       
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = tableView.dequeueReusableCell(withIdentifier: "searchCell", for: indexPath) as! SearchTableViewCell
        
        let movie = movies[indexPath.row]
        cell.title.text = movie.title
        cell.subtitle.text = movies[indexPath.row].year + "・" + movies[indexPath.row].length
        cell.rating.text = movies[indexPath.row].rating
        
        cell.posterImage?.alpha = 0.5
        DispatchQueue.global(qos: .background).async {
            let url = URL(string: movie.poster ?? "https://picsum.photos/seed/picsum/200/300")
            let data = try? Data(contentsOf: url!)
            DispatchQueue.main.async {
                cell.posterImage?.image = UIImage(data: data!)
                UIView.animate(withDuration: 1) {
                    cell.posterImage?.alpha = 1
                }
            }
        }
           return cell
       }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        <#code#>
    }
}
