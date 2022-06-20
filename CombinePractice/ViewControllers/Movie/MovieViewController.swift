//
//  MovieViewController.swift
//  CombinePractice
//
//  Created by Matthew Roberts on 22/07/2021.
//

import UIKit
import Combine

class MovieViewController: UIViewController, Storyboarded {
    
    var viewModel: MovieViewModel
    
    @IBOutlet weak private var tableView: UITableView!
    
    required init?(coder: NSCoder) {
        viewModel = MovieViewModel()
        super.init(coder: coder)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchMovies()
        print(viewModel.getMoviesCount())
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initTableView()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        viewModel.delegate?.moveToMovieDetailView()
    }
    
    private func fetchMovies() {
        Task {
            await viewModel.fetchMovies()
            tableView.reloadData()
        }
    }
    
    private func initTableView() {
        tableView.register(MovieCell.getNib(), forCellReuseIdentifier: MovieCell.getReuseIdentifier())
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.estimatedRowHeight = 150
        tableView.rowHeight = UITableView.automaticDimension
        tableView.backgroundColor = .purple
    }
}

extension MovieViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getMoviesCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieCell.getReuseIdentifier(), for: indexPath) as! MovieCell
        
        let movie = viewModel.getMovies()[indexPath.row]
        
        cell.setupCell(with: movie)
        cell.layoutIfNeeded()
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150.0
    }
}

