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
    private var allMovieGenreData: [Genres] = []
    
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
        let urlString: String = "https://api.themoviedb.org/3/genre/movie/list?api_key=0561fb61ccd13b5dea762e58b20f90e3&language=en-US"
        if let url: URL = URL(string: urlString) {
            if let data: Data = try? Data(contentsOf: url) {
                parse(json: data)
            }
        }
    }
    
    private func parse(json: Data) {
        let decoder = JSONDecoder()
        
        if let jsonData = try? decoder.decode(MovieGenresResponse.self, from: json) {
            var cellViewModel: [MovieGenreTableViewCellViewModel] = []
            for item in jsonData.genres {
                allMovieGenreData.append(contentsOf: jsonData.genres)
                let viewModel: MovieGenreTableViewCellViewModel = MovieGenreTableViewCellViewModel(id: item.id,
                                                                                                   movieGenre: item.name)
                cellViewModel.append(viewModel)
            }
            self.cellViewModel.append(contentsOf: cellViewModel)
            
            if self.cellViewModel.count > 0 {
                tableView.reloadData()
            }
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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movieId: Int = allMovieGenreData[indexPath.row].id
        let movieListVC: MovieListViewController = MovieListViewController(movieId: movieId)
        navigationController?.pushViewController(movieListVC, animated: true)
    }
}
