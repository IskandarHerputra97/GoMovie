//
//  MovieListViewController.swift
//  GoMovie
//
//  Created by Iskandar Herputra Wahidiyat on 26/05/21.
//

import UIKit

class MovieListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    private var cellViewModel: [MovieListTableViewCellViewModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        fetchMovieList()
    }

    //MARK: - Setup
    private func setupView() {
        title = "Movie List"
        tableView.register(UINib(nibName: "MovieListTableViewCell", bundle: nil), forCellReuseIdentifier: "MovieListTableViewCell")
    }

    //MARK: - Private
    private func fetchMovieList() {
        var cellViewModel: [MovieListTableViewCellViewModel] = []
        for item in 0...5 {
            let viewModel: MovieListTableViewCellViewModel = MovieListTableViewCellViewModel(movieName: "Movie Name")
            cellViewModel.append(viewModel)
        }
        self.cellViewModel.append(contentsOf: cellViewModel)
        
        if self.cellViewModel.count > 0 {
            tableView.reloadData()
        }
    }
}


extension MovieListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellViewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard indexPath.row < cellViewModel.count, let cell: MovieListTableViewCell = tableView.dequeueReusableCell(withIdentifier: "MovieListTableViewCell") as? MovieListTableViewCell else {
            return UITableViewCell()
        }
        let viewModel: MovieListTableViewCellViewModel = cellViewModel[indexPath.row]
        cell.setupContent(content: viewModel)
        return cell
    }
}

extension MovieListViewController: UITableViewDelegate {
    
}
