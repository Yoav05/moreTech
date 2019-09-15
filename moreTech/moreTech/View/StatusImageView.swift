//
//  statusImageView.swift
//  moreTech
//
//  Created by Yoav on 14/09/2019.
//  Copyright © 2019 Yoav. All rights reserved.
//

import UIKit

class StatusView: UIView {
    
    private var circleLabel: UILabel?
    
//    override init () {
//        super.init()
//    }
    
    func setStatus(status: Bool){
        if status {
            self.circleLabel?.backgroundColor = UIColor.green
            return
        }
        self.circleLabel?.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
    }
    
    override init (frame : CGRect) {
        super.init(frame : frame)
        
        circleLabel = UILabel()
        guard let circle = circleLabel else {return}
        self.addSubview(circle)
        circle.layer.masksToBounds = true
        circle.layer.cornerRadius = 5
        circle.translatesAutoresizingMaskIntoConstraints = false
        circle.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        circle.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        circle.heightAnchor.constraint(equalToConstant: 10.0).isActive = true
        circle.widthAnchor.constraint(equalToConstant: 10.0).isActive = true
        
        self.setStatus(status: false)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
