//
//  ViewController.swift
//  EmojiSlider
//
//  Created by Orkhan Alizada on 18.08.17.
//  Copyright © 2017 Orkhan Alizada. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var slider: UISlider!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.initialize()
    }
    
    func initialize() {
        self.slider.setThumbImage("🙂".toImage(), for: .normal)
        
        self.valueLabel.text = "Pretty Happy"
        self.valueLabel.sizeToFit()
        
        self.messageLabel.text = "Rate our app on the AppStore 🖖🏻"
        
        self.valueLabel.transform = CGAffineTransform(translationX: self.slider.thumbCenterX - self.valueLabel.frame.width / 2, y: 0)
        
        self.slider.minimumTrackTintColor = UIColor(red: 222.0/255.0, green: 222.0/255.0, blue: 222.0/255.0, alpha: 1.0)
        self.slider.maximumTrackTintColor = UIColor(red: 222.0/255.0, green: 222.0/255.0, blue: 222.0/255.0, alpha: 1.0)
        
        let delimiter = Int(self.slider.frame.width - 10.0) / 4
        for i in 0...4 {
            var xValue: Double = Double(delimiter * i)
            
            if i == 0 {
                xValue += 2.0
            }

            let view = UIView(frame: CGRect(x: xValue, y: 13.5, width: 10.0, height: 10.0))
            view.layer.cornerRadius = 5.0
            view.layer.masksToBounds = true
            
            view.backgroundColor = UIColor(red: 222.0/255.0, green: 222.0/255.0, blue: 222.0/255.0, alpha: 1.0)
            
            self.slider.addSubview(view)
        }
    }

    @IBAction func sliderValueChanged(_ sender: UISlider) {        
        sender.setValue(roundf(sender.value), animated: true)
        
        self.valueLabel.transform = CGAffineTransform(translationX: sender.thumbCenterX - self.valueLabel.frame.width / 2, y: 0)
        
        switch roundf(sender.value) {
        case 1:
            sender.setThumbImage("😤".toImage(), for: .normal)
            sender.setThumbImage("😤".toImage(), for: .highlighted)

            self.valueLabel.text = "Hate it!"
            self.valueLabel.sizeToFit()
            
            self.messageLabel.text = "Send us feedback ✉️"
        case 2:
            sender.setThumbImage("😕".toImage(), for: .normal)
            sender.setThumbImage("😕".toImage(), for: .highlighted)
            
            self.valueLabel.text = "Not happy"
            self.valueLabel.sizeToFit()
            
            self.messageLabel.text = "Send us feedback ✉️"
        case 3:
            sender.setThumbImage("🙂".toImage(), for: .normal)
            sender.setThumbImage("🙂".toImage(), for: .highlighted)
            
            self.valueLabel.text = "Pretty Happy"
            self.valueLabel.sizeToFit()
            
            self.messageLabel.text = "Rate our app on the AppStore 🖖🏻"
        case 4:
            sender.setThumbImage("😊".toImage(), for: .normal)
            sender.setThumbImage("😊".toImage(), for: .highlighted)
            
            self.valueLabel.text = "Very Happy"
            self.valueLabel.sizeToFit()
            
            self.messageLabel.text = "Rate our app on the AppStore 🖖🏻"
        case 5:
            sender.setThumbImage("😍".toImage(), for: .normal)
            sender.setThumbImage("😍".toImage(), for: .highlighted)
            
            self.valueLabel.text = "Love it!"
            self.valueLabel.sizeToFit()
            
            self.messageLabel.text = "Rate our app on the AppStore 🖖🏻"
        default:
            return
        }
    }
}

extension String {
    func toImage() -> UIImage {
        let size = CGSize(width: 30, height: 35)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        
        UIColor.clear.set()
        
        let rect = CGRect(origin: .zero, size: size)
        UIRectFill(CGRect(origin: .zero, size: size))
        
        (self as NSString).draw(in: rect, withAttributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 30)])
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image!
    }
}

extension UISlider {
    var thumbCenterX: CGFloat {
        let trackRect = self.trackRect(forBounds: frame)
        let thumbRect = self.thumbRect(forBounds: bounds, trackRect: trackRect, value: value)
        
        return thumbRect.midX
    }
}
