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
    
    private let rightOffset: CGFloat = 15
    private let topOffset: CGFloat = 15
    
    private var statusView: StatusView = {
        return StatusView()
    }()
    
    private var nameLabel: UILabel = {
        return UILabel()
    }()
    private var amountLabel: UILabel = {
        return UILabel()
    }()
    private var timeLabel: UILabel = {
        return UILabel()
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        //self.backgroundColor = #colorLiteral(red: 0.9940351844, green: 1, blue: 0, alpha: 1)
        let borderView = UIView()
        borderView.backgroundColor = UIColor.clear
        borderView.layer.cornerRadius = 20
        borderView.layer.borderWidth = 2;
        borderView.layer.borderColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        self.addSubview(borderView)
        
        
        nameLabel.text = "Tusovka"
        nameLabel.textColor = grayLabelColor
        nameLabel.font = textFontLarge;
        self.addSubview(nameLabel)
        
        amountLabel.text = "1000r"
        amountLabel.textColor = grayLabelColor
        amountLabel.font = textFontLarge;
        self.addSubview(amountLabel)
        
        timeLabel.text = "12 Oct, 11:11"
        timeLabel.font = textFontSmall
        timeLabel.textColor = UIColor.lightGray
        self.addSubview(timeLabel)
        
        statusView.setStatus(status: true)
        self.addSubview(statusView)
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        statusView.translatesAutoresizingMaskIntoConstraints = false
        amountLabel.translatesAutoresizingMaskIntoConstraints = false
        borderView.translatesAutoresizingMaskIntoConstraints = false
        let constraints: [NSLayoutConstraint] =
            [
                borderView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                borderView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
                borderView.heightAnchor.constraint(equalTo: self.heightAnchor),
                borderView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.9),
                
                nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
                nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
                
                amountLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
                amountLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
                
                timeLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
                timeLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20),
                
                statusView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
                statusView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40)
            ]

        self.addConstraints(constraints)
    }
    
    public func setEvent(event: EventResponse){
        self.nameLabel.text = event.name
        self.amountLabel.text = String(event.amount) + " р."
        self.timeLabel.text = event.date
        self.statusView.setStatus(status: event.state == "1" ? true : false)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
