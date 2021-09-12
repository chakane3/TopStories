//
//  TopStoriesViewController.swift
//  TopStories
//
//  Created by Chakane Shegog on 9/9/21.
//  Copyright © 2021 Alex Paul. All rights reserved.
//

import UIKit

class NewsFeedController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    // create data for the table view
    var headlines = [NewsHeadline]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        loadData()
        searchBar.delegate = self
    }
    
    func loadData(){
        headlines = HeadlinesData.getHeadlines()
    }
    
    func filterHeadlines(for searchText: String) {
        guard !searchText.isEmpty else {return}
        // we will get our headlines, then filter by title which well lowercase,
        // if that title contains anything in the user searchText we will return/change our headlines data for the tableView
        headlines = HeadlinesData.getHeadlines().filter {$0.title.lowercased().contains(searchText.lowercased())}
    }
}

extension NewsFeedController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return headlines.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "headlineCell", for: indexPath) as? HeadlineCell else {
            fatalError("couldent dequeue a headline cell")
        }
        let headline = headlines[indexPath.row]
        cell.configureCell(for: headline)
        return cell
    }
}

extension NewsFeedController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
}

extension NewsFeedController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        // dismiss the keyboard
        searchBar.resignFirstResponder()
    }
    
    // realtime searching & what if the search was empty
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard !searchText.isEmpty else { // if the search text is empty use loadData() to reset the table view
            loadData()
            return
        }
        filterHeadlines(for: searchText)
    }
    
    
    
}
