//
//  ViewController.swift
//  FacebookFeed
//
//  Created by Orkhan Alizada on 20.08.17.
//  Copyright © 2017 Orkhan Alizada. All rights reserved.
//

import UIKit

class FeedViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    var posts = [Post]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.posts.append(Post(name: "Orkhan Alizada", statusText: "Create over 50 different projects that will teach you everything from the fundamentals of art, drawing realistic light and shadow, drawing perspective drawings, and more.", profileImageName: "profileImage_Me", likesCount: 563, commentsCount: 144, statusImageName: "statusImage_Default"))
        
        self.posts.append(Post(name: "Steve Jobs", statusText: "Traditional classes can cost $600 or more, but since Udemy courses are online and on-demand, you’ll get the same world-class instruction for less than $20! Plus, you’ll get lifetime access to your content, can learn at your own pace on any device, and you’re protected by a 100% money-back guarantee. \nNew to Udemy? For a limited time, take almost any course for a special discount!", profileImageName: "profileImage_Steve", likesCount: 733, commentsCount: 314, statusImageName: "statusImage_Mac"))
        
        navigationItem.title = "Feed"
        
        self.collectionView?.backgroundColor = UIColor(white: 0.95, alpha: 1.0)
        self.collectionView?.register(FeedCell.self, forCellWithReuseIdentifier: "Cell")
        self.collectionView?.alwaysBounceVertical = true
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.posts.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let feedCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! FeedCell
        feedCell.post = self.posts[indexPath.item]
        
        return feedCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if let statusText = self.posts[indexPath.item].statusText {
            let rect = NSString(string: statusText).boundingRect(with: CGSize(width: self.view.frame.width, height: 1000), options: [.usesFontLeading, .usesLineFragmentOrigin], attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14)], context: nil)
            
            let knownHeight: CGFloat = 8 + 44 + 4 + 4 + 200 + 8 + 24 + 8 + 44 + 8
            
            return CGSize(width: self.view.frame.width, height: rect.height + knownHeight)
        }
        
        return CGSize(width: view.frame.width, height: 500.0)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        self.collectionView?.collectionViewLayout.invalidateLayout()
    }
}
