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
    private var allMovieData: [Results] = []
    
    private var movieId: Int

    //MARK: - Lifecycle
    required init(movieId: Int) {
        self.movieId = movieId
        super.init(nibName: "MovieListViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
        let urlString: String = "https://api.themoviedb.org/3/movie/\(movieId)/lists?api_key=0561fb61ccd13b5dea762e58b20f90e3&language=en-US&page=1"
        if let url: URL = URL(string: urlString) {
            if let data: Data = try? Data(contentsOf: url) {
                parse(json: data)
            }
        }
    }
    
    private func parse(json: Data) {
        let decoder = JSONDecoder()
        
        if let jsonData = try? decoder.decode(MovieListResponse.self, from: json) {
            var cellViewModel: [MovieListTableViewCellViewModel] = []
            for item in jsonData.results {
                allMovieData.append(contentsOf: jsonData.results)
                let viewModel: MovieListTableViewCellViewModel = MovieListTableViewCellViewModel(movieName: item.name)
                cellViewModel.append(viewModel)
            }
            self.cellViewModel.append(contentsOf: cellViewModel)
            
            if self.cellViewModel.count > 0 {
                tableView.reloadData()
            }
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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movieId: Int = allMovieData[indexPath.row].id
        let movieDetailVC: MovieDetailViewController = MovieDetailViewController(movieId: movieId)
        navigationController?.pushViewController(movieDetailVC, animated: true)
    }
}
