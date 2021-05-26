//
//  HomeViewController.swift
//  GoMovie
//
//  Created by Iskandar Herputra Wahidiyat on 25/05/21.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    private var cellViewModel: [MovieGenreTableViewCellViewModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        fetchGenres()
    }
    
    //MARK: - Setup
    private func setupView() {
        title = "Home Page"
        tableView.register(UINib(nibName: "MovieGenreTableViewCell", bundle: nil), forCellReuseIdentifier: "MovieGenreTableViewCell")
    }
    
    //MARK: - Private
    private func fetchGenres() {
        var cellViewModel: [MovieGenreTableViewCellViewModel] = []
        for item in 0...5 {
            let viewModel: MovieGenreTableViewCellViewModel = MovieGenreTableViewCellViewModel(movieGenre: "Dummy Movie Genre")
            cellViewModel.append(viewModel)
        }
        self.cellViewModel.append(contentsOf: cellViewModel)
        
        if self.cellViewModel.count > 0 {
            tableView.reloadData()
        }
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellViewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard indexPath.row < cellViewModel.count, let cell: MovieGenreTableViewCell = tableView.dequeueReusableCell(withIdentifier: "MovieGenreTableViewCell") as? MovieGenreTableViewCell else {
            return UITableViewCell()
        }
        let viewModel: MovieGenreTableViewCellViewModel = cellViewModel[indexPath.row]
        cell.setupContent(content: viewModel)
        return cell
    }
}

extension HomeViewController: UITableViewDelegate {
    
}
