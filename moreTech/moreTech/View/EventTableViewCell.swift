//
//  EventTableViewCell.swift
//  moreTech
//
//  Created by Yoav on 14/09/2019.
//  Copyright © 2019 Yoav. All rights reserved.
//

import UIKit

class EventTableViewCell: UITableViewCell, UITextFieldDelegate {
    
    
    
    var nameTextFiled: UITextField?
    var countMoneyTextField: UITextField?
    private var rubleLabel: UILabel?
    private var circleLabel: UILabel?
    private var grayLabel: UILabel = {
        let lbl = UILabel()
        lbl.backgroundColor = grayLabelColor
        return lbl
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        circleLabel = UILabel()
        guard let circle = circleLabel else {return}
        contentView.addSubview(circle)
        circle.layer.masksToBounds = true
        circle.layer.cornerRadius = 5
        circle.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        circle.translatesAutoresizingMaskIntoConstraints = false
        circle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20.0).isActive = true
        circle.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        circle.heightAnchor.constraint(equalToConstant: 10.0).isActive = true
        circle.widthAnchor.constraint(equalToConstant: 10.0).isActive = true
        
        //name label
        nameTextFiled = UITextField()
        guard let textField = nameTextFiled else {
            return
        }
        textField.placeholder = "Имя"
        textField.delegate = self
        textField.font = textFontMedium
        contentView.addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 20.0).isActive = true
        textField.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
        textField.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        
        
        //money
        countMoneyTextField = UITextField()
        guard let money = countMoneyTextField else {
            return
        }
        money.placeholder = "Ввведите ₽"
        money.font = textFontMedium
        money.delegate = self
        contentView.addSubview(money)
        money.keyboardType = UIKeyboardType.decimalPad
        money.translatesAutoresizingMaskIntoConstraints = false
        money.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 10.0).isActive = true
        money.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10.0).isActive = true
        //ruble label
        rubleLabel = UILabel()
        guard let ruble = rubleLabel else { return }
        ruble.text = "₽"
        ruble.font = textFontMedium
        contentView.addSubview(ruble)
        ruble.translatesAutoresizingMaskIntoConstraints = false
        ruble.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 10.0).isActive = true
        ruble.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        money.rightAnchor.constraint(lessThanOrEqualTo: ruble.leftAnchor).isActive = true
        //gray label
        contentView.addSubview(grayLabel)
        grayLabel.translatesAutoresizingMaskIntoConstraints = false
        grayLabel.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        grayLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        grayLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.9).isActive = true
        grayLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 1.0).isActive = true

    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}
