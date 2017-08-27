//
//  Extensions.swift
//  YouTube
//
//  Created by Orkhan Alizada on 27.08.17.
//  Copyright © 2017 Orkhan Alizada. All rights reserved.
//

import UIKit

extension UIView {
    func addConstraintsWith(format: String, views: UIView...) {
        var viewsDictionary = [String: UIView]()
        
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDictionary[key] = view
        }
        
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
    }
}
