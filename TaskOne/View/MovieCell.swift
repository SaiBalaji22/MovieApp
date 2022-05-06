//
//  MovieCell.swift
//  TaskOne
//
//  Created by Sai Balaji on 05/05/22.
//

import Foundation
import SDWebImage
import UIKit

class MovieCell: UITableViewCell{
    //MARK: - PROPERTIES
    
    static let CELL_ID = "MOVIE_CELL"
    
    private var MoviePosterImageView: UIImageView = {
        let ImageView = UIImageView()
        //ImageView.backgroundColor = .purple
        return ImageView
    }()
    
    private var MovieRatingLabel: UILabel = {
        let RatingLabel = UILabel(frame: .zero)
        RatingLabel.text = "RATING_HERE"
        RatingLabel.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        RatingLabel.numberOfLines = 0
        return RatingLabel
    }()
    
    private var MovieTitleLabel: UILabel = {
        let TitleLabel = UILabel(frame: .zero)
        TitleLabel.text = "MOVIE_NAME_HERE"
        TitleLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        TitleLabel.numberOfLines = 0
        return TitleLabel
    }()
    
    //MARK: - INITIALIZERS
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: MovieCell.CELL_ID)
        configureUI()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    //MARK: - HELPERS
    func configureUI(){
        addSubview(MoviePosterImageView)
        MoviePosterImageView.translatesAutoresizingMaskIntoConstraints = false
        MoviePosterImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        MoviePosterImageView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        MoviePosterImageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        MoviePosterImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        MoviePosterImageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        addSubview(MovieTitleLabel)
        MovieTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        MovieTitleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        MovieTitleLabel.leftAnchor.constraint(equalTo: MoviePosterImageView.rightAnchor,constant: 30).isActive = true
        MovieTitleLabel.widthAnchor.constraint(equalToConstant: frame.size.width/1.2).isActive = true
        
        addSubview(MovieRatingLabel)
        MovieRatingLabel.translatesAutoresizingMaskIntoConstraints = false
        MovieRatingLabel.centerYAnchor.constraint(equalTo: centerYAnchor,constant: 200).isActive = true
        MovieRatingLabel.leftAnchor.constraint(equalTo: MoviePosterImageView.rightAnchor,constant: 40).isActive = true
        MovieRatingLabel.widthAnchor.constraint(equalToConstant: frame.size.width).isActive = true
        
      
    }
    
    func updateCell(MovieName: String?,MoviePosterURL: String?,Rating: Double?){
        
        if let MovieName = MovieName , let MoviePosterURL = MoviePosterURL , let Rating = Rating{
            
            guard let POSTER_URL = URL(string: "https://image.tmdb.org/t/p/w500/\(MoviePosterURL)") else{return }
            
            self.MovieTitleLabel.text = MovieName
            self.MovieRatingLabel.text = "★\(Rating)"
            self.MoviePosterImageView.sd_setImage(with:POSTER_URL)
        }
    }
    
}