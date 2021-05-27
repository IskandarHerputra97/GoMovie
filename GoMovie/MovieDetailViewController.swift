//
//  MovieDetailViewController.swift
//  GoMovie
//
//  Created by Iskandar Herputra Wahidiyat on 27/05/21.
//

import UIKit

class MovieDetailViewController: UIViewController {
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieOverViewTextView: UITextView!
    
    private var movieId: Int
    
    //MARK: - Lifecycle
    required init(movieId: Int) {
        self.movieId = movieId
        super.init(nibName: "MovieDetailViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchMovieDetail()
    }

    //MARK: - Setup
    private func setupView() {
        title = "Movie Detail"
    }
    //MovieDetail
    //MARK: - Private
    private func fetchMovieDetail() {
        let urlString: String = "https://api.themoviedb.org/3/movie/\(movieId)?api_key=0561fb61ccd13b5dea762e58b20f90e3&language=en-US"
        if let url: URL = URL(string: urlString) {
            if let data: Data = try? Data(contentsOf: url) {
                parse(json: data)
            }
        }
    }
    
    private func parse(json: Data) {
        let decoder = JSONDecoder()
        
        if let jsonData = try? decoder.decode(MovieDetail.self, from: json) {
            movieTitleLabel.text = jsonData.original_title
            movieOverViewTextView.text = jsonData.overview
        }
    }
}
