//
//  MovieGenreTableViewCell.swift
//  GoMovie
//
//  Created by Iskandar Herputra Wahidiyat on 26/05/21.
//

import UIKit

final class MovieGenreTableViewCellViewModel {
    private(set) var id: Int = 0
    private(set) var movieGenre: String = ""
    
    init(id: Int?,
         movieGenre: String?) {
        if let id: Int = id {
            self.id = id
        }
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
