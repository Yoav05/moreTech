//
//  EventCell.swift
//  moreTech
//
//  Created by Gagik on 14/09/2019.
//  Copyright © 2019 Yoav. All rights reserved.
//

import Foundation
import UIKit

class EventCell: UITableViewCell{
    
    private var indicator: UIImageView{
        return UIImageView()
    }
    
    private var nameLabel: UILabel{
        return UILabel()
    }
    private var timeLabel: UILabel{
        return UILabel()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        let gradient = CAGradientLayer()
//        gradient.frame = bounds
//        gradient.startPoint = CGPoint(x: 0.0, y: 1.0)
//        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
//        gradient.colors = [UIColor.white.cgColor, UIColor.red]
//        layer.insertSublayer(gradient, at: 0)
        self.backgroundColor = #colorLiteral(red: 0.9009569287, green: 0.9889369607, blue: 0.01758909412, alpha: 1)
        self.layer.cornerRadius = 20
        
        nameLabel.text = "Tusovka"
        self.addSubview(nameLabel)
        
        timeLabel.text = "12 Oct, 11:11"
        timeLabel.textColor = UIColor.lightGray
        self.addSubview(timeLabel)
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        let constraints: [NSLayoutConstraint] =
            [
                nameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
//                nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//                nameLabel.topAnchor.constraint(equalTo: view.topAnchor),
//                nameLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        
        self.addConstraints(constraints)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
