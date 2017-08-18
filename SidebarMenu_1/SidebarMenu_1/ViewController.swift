//
//  ViewController.swift
//  SidebarMenu_1
//
//  Created by Orkhan Alizada on 16.08.17.
//  Copyright © 2017 Orkhan Alizada. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var sideBarView: UIView!
    @IBOutlet weak var mailButton: UIButton!
    @IBOutlet weak var homeButton: UIButton!
    @IBOutlet weak var alertButton: UIButton!
    @IBOutlet weak var retweetButton: UIButton!
    @IBOutlet weak var flagButton: UIButton!
    @IBOutlet weak var curveImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.setup()
    }

    func setup() {
        self.hideSideBarMenu()
        
        self.homeButton.imageView?.contentMode = .scaleAspectFit
        self.mailButton.imageView?.contentMode = .scaleAspectFit
        self.alertButton.imageView?.contentMode = .scaleAspectFit
        self.retweetButton.imageView?.contentMode = .scaleAspectFit
        self.flagButton.imageView?.contentMode = .scaleAspectFit
    }
    
    func hideSideBarMenu() {
        UIView.animate(withDuration: 0.4, delay: 0.3, options: .curveEaseOut, animations: {
            self.curveImageView.transform = CGAffineTransform(translationX: -self.curveImageView.frame.width, y: 0)
        }, completion: nil)
        
        UIView.animate(withDuration: 0.4, delay: 0.3, options: .curveEaseOut, animations: {
            self.alertButton.transform = CGAffineTransform(translationX: -self.curveImageView.frame.width, y: 0)
        })
        
        UIView.animate(withDuration: 0.4, delay: 0.2, options: .curveEaseOut, animations: {
            self.mailButton.transform = CGAffineTransform(translationX: -self.curveImageView.frame.width, y: 0)
            
            self.retweetButton.transform = CGAffineTransform(translationX: -self.curveImageView.frame.width, y: 0)
        })
        
        UIView.animate(withDuration: 0.4, delay: 0.1, options: .curveEaseOut, animations: {
            self.homeButton.transform = CGAffineTransform(translationX: -self.curveImageView.frame.width, y: 0)
            
            self.flagButton.transform = CGAffineTransform(translationX: -self.curveImageView.frame.width, y: 0)
        })
    }
    
    func showSideBarMenu() {
        UIView.animate(withDuration: 0.4, delay: 0.0, options: .curveEaseOut, animations: {
            self.curveImageView.transform = .identity
        }, completion: nil)
        
        UIView.animate(withDuration: 0.4, delay: 0.1, options: .curveEaseOut, animations: {
            self.alertButton.transform = .identity
        })
        
        UIView.animate(withDuration: 0.4, delay: 0.2, options: .curveEaseOut, animations: {
            self.mailButton.transform = .identity
            self.retweetButton.transform = .identity
        })
        
        UIView.animate(withDuration: 0.4, delay: 0.3, options: .curveEaseOut, animations: {
            self.homeButton.transform = .identity
            self.flagButton.transform = .identity
        })
    }

    var menuOpened = false
    @IBAction func menuButtonClicked(_ sender: UIBarButtonItem) {
        if !self.menuOpened {
            self.showSideBarMenu()
            
            self.menuOpened = true
        } else {
            self.hideSideBarMenu()
            
            self.menuOpened = false
        }
    }
}

