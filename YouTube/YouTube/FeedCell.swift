//
//  FeedCell.swift
//  YouTube
//
//  Created by Orkhan Alizada on 27.08.17.
//  Copyright © 2017 Orkhan Alizada. All rights reserved.
//

import UIKit

class FeedCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let thumbnailImageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.image = #imageLiteral(resourceName: "cover")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        
        return imageView
    }()
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.image = #imageLiteral(resourceName: "avatar")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        
        return imageView
    }()
    
    let separatorView: UIView = {
        let view  = UIView()
        
        view.backgroundColor = UIColor.black
        
        return view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Daft Punk - Motherboard"
        
        return label
    }()
    
    let subtitleTextView: UITextView = {
        let textView = UITextView()
        
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.text = "DaftPunkVEVO ‧ 1.6M views \n3 years ago"
        
        return textView
    }()
    
    func setup() {
        self.addSubview(self.thumbnailImageView)
        self.addSubview(self.profileImageView)
        self.addSubview(self.separatorView)
        self.addSubview(self.titleLabel)
        self.addSubview(self.subtitleTextView)
        
        // Horizontal Constraints
        self.addConstraintsWith(format: "H:|-16-[v0]-16-|", views: self.thumbnailImageView)
        self.addConstraintsWith(format: "H:|-16-[v0(44)]", views: self.profileImageView)
        self.addConstraintsWith(format: "H:|[v0]|", views: self.separatorView)
        
        // Vertical Constraints
        self.addConstraintsWith(format: "V:|-16-[v0]-8-[v1(44)]-16-[v2(1)]|", views: self.thumbnailImageView, self.profileImageView, self.separatorView)
        
        // Top Constraints
        self.addConstraint(NSLayoutConstraint(item: self.titleLabel, attribute: .top, relatedBy: .equal, toItem: self.thumbnailImageView, attribute: .bottom, multiplier: 1.0, constant: 8.0))
        self.addConstraint(NSLayoutConstraint(item: self.subtitleTextView, attribute: .top, relatedBy: .equal, toItem: self.titleLabel, attribute: .bottom, multiplier: 1.0, constant: 8.0))

        // Left Constraints
        self.addConstraint(NSLayoutConstraint(item: self.titleLabel, attribute: .left, relatedBy: .equal, toItem: self.profileImageView, attribute: .right, multiplier: 1.0, constant: 8))
        self.addConstraint(NSLayoutConstraint(item: self.subtitleTextView, attribute: .left, relatedBy: .equal, toItem: self.profileImageView, attribute: .right, multiplier: 1.0, constant: 8))

        // Right Constraints
        self.addConstraint(NSLayoutConstraint(item: self.titleLabel, attribute: .right, relatedBy: .equal, toItem: self.thumbnailImageView, attribute: .right, multiplier: 1.0, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: self.subtitleTextView, attribute: .right, relatedBy: .equal, toItem: self.thumbnailImageView, attribute: .right, multiplier: 1.0, constant: 0))

        // Height Constraints
        self.addConstraint(NSLayoutConstraint(item: self.titleLabel, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0.0, constant: 20.0))
        self.addConstraint(NSLayoutConstraint(item: self.subtitleTextView, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0.0, constant: 20.0))
    }
}
