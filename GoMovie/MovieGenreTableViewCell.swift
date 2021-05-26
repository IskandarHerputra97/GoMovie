//
//  MovieGenreTableViewCell.swift
//  GoMovie
//
//  Created by Iskandar Herputra Wahidiyat on 26/05/21.
//

import UIKit

final class MovieGenreTableViewCellViewModel {
    private(set) var movieGenre: String = ""
    
    init(movieGenre: String?) {
        if let movieGenre: String = movieGenre {
            self.movieGenre = movieGenre
        }
    }
}

class MovieGenreTableViewCell: UITableViewCell {
    @IBOutlet weak var movieGenreLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupContent(content: MovieGenreTableViewCellViewModel) {
        movieGenreLabel.text = content.movieGenre
    }
}
