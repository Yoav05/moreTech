//
//  EventViewController.swift
//  moreTech
//
//  Created by Yoav on 14/09/2019.
//  Copyright © 2019 Yoav. All rights reserved.
//

import UIKit


class EventViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {

    
    private var participantsArray = [Participant]()
    
    private var plusButton: UIButton = {
        let bt = UIButton(type: .system)
        bt.setTitle("+", for: .normal)
        bt.addTarget(self, action: #selector(plusButtonTapped), for: .touchUpInside)
        bt.tintColor = UIColor.white
        bt.backgroundColor = orangelabelColor
        bt.titleLabel?.textAlignment = .center
        bt.titleLabel?.font = textFontLarge
        bt.layer.cornerRadius = labelLayerCornerRadius
        return bt
    }()
    
    private var minusButton: UIButton = {
        let bt = UIButton(type: .system)
        bt.isEnabled = false
        bt.setTitle("-", for: .normal)
        bt.addTarget(self, action: #selector(minusButtonTapped), for: .touchUpInside)
        bt.tintColor = UIColor.white
        bt.backgroundColor = orangelabelColor
        bt.titleLabel?.textAlignment = .center
        bt.titleLabel?.font = textFontLarge
        bt.layer.cornerRadius = labelLayerCornerRadius
        return bt
    }()
    
    private var amountLabel: UILabel = {
       return UILabel()
    }()
    
    private var lineLabel: UILabel = {
        let lbl = UILabel()
        lbl.backgroundColor = grayLabelColor
        return lbl
    }()
    
    private var nextButton: UIButton = {
        let lbl = UIButton(type: .system)
        lbl.titleLabel?.font = textFontMedium
        lbl.backgroundColor = orangelabelColor
        lbl.tintColor = UIColor.white
        return lbl
    }()

    
    private var peopleCounter: Int = 1
    private var allMoney: Double = 0.0
    
    @objc private func plusButtonTapped() {
        if (peopleCounter >= 1) {
            minusButton.isEnabled = true
        }

        peopleCounter += 1
        amountLabel.text = String(peopleCounter)
        guard let tableView = eventTableView else { return }
        tableView.reloadData()
    }
    
    @objc private func minusButtonTapped() {
        if (peopleCounter <= 1) {
            minusButton.isEnabled = false
        } else {

            peopleCounter -= 1
            amountLabel.text = String(peopleCounter)
            guard let tableView = eventTableView else { return }
            tableView.reloadData()
        }
    }
    
    private var eventTableView: UITableView?
    private let cellID = "ididid"

    private let topAnchorConstHeight: CGFloat = 20.0

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()

        // Do any additional setup after loading the view.
    }
    
    private var commonMoney: UILabel = {
        let lbl = UILabel()
        lbl.text = "Общая сумма:"
        lbl.font = textFontMedium
        lbl.textColor = grayLabelColor
        return lbl
    }()
    private var commonMoneyTextField: UITextField = {
        let txtField = UITextField()
        txtField.placeholder = "Ввведите ₽"
        txtField.font = textFontMedium
        return txtField
        
    }()
    private var ownerMoney: UILabel = {
        let lbl = UILabel()
        lbl.text = "Я заплатил:"
        lbl.font = textFontMedium
        lbl.textColor = grayLabelColor
        return lbl
    }()
    private var ownerMoneyField: UITextField = {
        let txtField = UITextField()
        txtField.placeholder = "Ввведите ₽"
        txtField.font = textFontMedium
        return txtField
    }()
    
    private let refreshControl = UIRefreshControl()
    
    private func setupUI() {
        
        view.backgroundColor = UIColor.white
        
        //
        view.addSubview(commonMoney)
        commonMoney.translatesAutoresizingMaskIntoConstraints = false
        commonMoney.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20.0).isActive = true
        commonMoney.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 10.0).isActive = true
        
        view.addSubview(commonMoneyTextField)
        commonMoneyTextField.delegate = self
        commonMoneyTextField.keyboardType = UIKeyboardType.decimalPad
        commonMoneyTextField.translatesAutoresizingMaskIntoConstraints = false
        commonMoneyTextField.textAlignment = .right
        commonMoneyTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10.0).isActive = true
        commonMoneyTextField.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 10.0).isActive = true
        
        view.addSubview(ownerMoney)
        ownerMoney.translatesAutoresizingMaskIntoConstraints = false
        ownerMoney.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20.0).isActive = true
        ownerMoney.topAnchor.constraint(equalTo: commonMoney.bottomAnchor, constant: 10.0).isActive = true
        
        view.addSubview(ownerMoneyField)
        ownerMoneyField.delegate = self
        ownerMoneyField.keyboardType = UIKeyboardType.decimalPad
        ownerMoneyField.translatesAutoresizingMaskIntoConstraints = false
        ownerMoneyField.textAlignment = .right
        ownerMoneyField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10.0).isActive = true
        ownerMoneyField.topAnchor.constraint(equalTo: commonMoney.bottomAnchor, constant: 10.0).isActive = true
    
        //AmountLabel
        view.addSubview(amountLabel)
        amountLabel.translatesAutoresizingMaskIntoConstraints = false
        amountLabel.font = textFontLarge
        amountLabel.textAlignment = .center
        amountLabel.topAnchor.constraint(equalTo:ownerMoneyField.bottomAnchor, constant: 20).isActive = true
        amountLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        amountLabel.text = "1"
        
        //minusButton
        view.addSubview(minusButton)
        minusButton.translatesAutoresizingMaskIntoConstraints = false
        minusButton.topAnchor.constraint(equalTo: ownerMoneyField.bottomAnchor, constant: topAnchorConstHeight).isActive = true
        minusButton.rightAnchor.constraint(equalTo: amountLabel.rightAnchor, constant: -60).isActive = true
        let size:CGFloat = 40
        minusButton.widthAnchor.constraint(equalToConstant: size).isActive = true
        minusButton.heightAnchor.constraint(equalToConstant: size).isActive = true
        
        view.addSubview(plusButton)
        plusButton.translatesAutoresizingMaskIntoConstraints = false
        plusButton.topAnchor.constraint(equalTo: ownerMoneyField.bottomAnchor, constant: topAnchorConstHeight).isActive = true
        plusButton.leftAnchor.constraint(equalTo: amountLabel.leftAnchor, constant: 60).isActive = true
        plusButton.widthAnchor.constraint(equalToConstant: size).isActive = true
        plusButton.heightAnchor.constraint(equalToConstant: size).isActive = true
        
        view.addSubview(lineLabel)
        lineLabel.translatesAutoresizingMaskIntoConstraints = false
        lineLabel.topAnchor.constraint(equalTo: amountLabel.bottomAnchor, constant: topAnchorConstHeight).isActive = true
        lineLabel.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        lineLabel.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        lineLabel.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        
        //nextButton
        
        view.addSubview(nextButton)
        nextButton.setTitle("Вперёд!", for: .normal)
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.heightAnchor.constraint(equalToConstant: 40.0).isActive = true
        nextButton.bottomAnchor.constraint(equalTo: self.view.layoutMarginsGuide.bottomAnchor, constant: -10.0).isActive = true
        nextButton.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 10).isActive = true
        nextButton.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -10).isActive = true
        nextButton.layer.cornerRadius = 12.5

        
        eventTableView = UITableView()
        guard let tableView = eventTableView else { return }
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 80.0
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = true
        tableView.register(EventTableViewCell.self, forCellReuseIdentifier: cellID)
        tableView.showsVerticalScrollIndicator = false
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: lineLabel.bottomAnchor, constant: 5.0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: nextButton.topAnchor, constant: -5.0).isActive =  true
        tableView.rightAnchor.constraint(equalTo: self.view.layoutMarginsGuide.rightAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: self.view.layoutMarginsGuide.leftAnchor).isActive = true
        tableView.allowsSelection = false
        tableView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
    }
    
    @objc private func refreshData() {
        //upd
    }
    @objc private func nextButtonTapped() {

        loopThroughElements()
        if participantsArray.count < 1 {
            let alert = UIAlertController(title: "Добавьте участников", message: "Введите все поля", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Click", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        } else {
            let qrVC = QRViewController()
            qrVC.participants = self.participantsArray
            navigationController?.pushViewController(qrVC, animated: true)
        }

    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return peopleCounter
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as? EventTableViewCell {
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    private func loopThroughElements() {
        if let cells = self.eventTableView?.visibleCells as? Array<EventTableViewCell> {
            for cell in cells {
                // look at data
                if let nameText = cell.nameTextFiled?.text {
                    if (nameText == "") {
                        participantsArray.removeAll()
                        break
                    }
                    if let money = cell.countMoneyTextField?.text {
                        if (money == "" ) {
                            participantsArray.removeAll()
                            break
                        }
                        let dmoney = (money as NSString).doubleValue
                        let user = Participant(idEvent: "1", amountMoney: dmoney, numberKey: "150", name: nameText)
                        participantsArray.append(user)
                    }
                }
            }
        }
    }
    
    //MARK: - Text Field Delegate Methods
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == commonMoneyTextField {
            if let text = commonMoneyTextField.text {
                allMoney = (text as NSString).doubleValue
            }
        } else if textField == ownerMoneyField {
            if let text = ownerMoneyField.text {
                print(text)
                allMoney -= (text as NSString).doubleValue
            }
        }
        print(allMoney)
    }
}
