//
//  MovieListTableViewCell.swift
//  GoMovie
//
//  Created by Iskandar Herputra Wahidiyat on 26/05/21.
//

import UIKit

final class MovieListTableViewCellViewModel {
    private(set) var movieName: String = ""
    
    init(movieName: String?) {
        if let movieName: String = movieName {
            self.movieName = movieName
        }
    }
}

class MovieListTableViewCell: UITableViewCell {
    @IBOutlet weak var movieNameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupContent(content: MovieListTableViewCellViewModel) {
        movieNameLabel.text = content.movieName
    }
}
