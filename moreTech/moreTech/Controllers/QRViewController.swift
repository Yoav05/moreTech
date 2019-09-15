//
//  QRViewController.swift
//  moreTech
//
//  Created by Yoav on 15/09/2019.
//  Copyright © 2019 Yoav. All rights reserved.
//

import UIKit

class QRViewController: UIViewController, UITextFieldDelegate {
    
    var participants = [Participant]()
    
    private var arrIndex: Int = 0
    var qrImageView: UIImageView?
    var nameLabel: UILabel?
    var sumLabel: UILabel?
    var switchToNumber: UISwitch?
    var nextButton: UIButton?
    var numberLabel: UILabel?
    var numberNotification: UITextField?
    var upConstraint: NSLayoutConstraint?
    var downConstraint: NSLayoutConstraint?

    
//    let image = generateQRCode(from: "Hacking with Swift is the best iOS coding tutorial I've ever read!")

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.tintColor = UIColor.black
        setupUI()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.tintColor = orangelabelColor
    }
    
    private func setupUI() {

        
        
        //name Label
        nameLabel = UILabel()
        guard let userLabel = nameLabel else { return }
        view.addSubview(userLabel)
        userLabel.translatesAutoresizingMaskIntoConstraints = false
        userLabel.font = textFontBig
//        userLabel.backgroundColor = orangelabelColor
//        userLabel.textColor = UIColor.white
        userLabel.layer.masksToBounds = true
        userLabel.layer.cornerRadius = 10.0
        userLabel.text = "Вася Пупкин" //  participants = [Participant]()
        userLabel.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor, constant: 20.0).isActive = true
        userLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        userLabel.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.8).isActive = true
        userLabel.textAlignment = .center
        
        view.backgroundColor = UIColor.white
        qrImageView = UIImageView()
        guard let imageView = qrImageView else { return }
        view.addSubview(imageView)
        imageView.image = generateQRCode(from: "SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS")// participants = [Participant]()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: userLabel.bottomAnchor, constant: 20.0).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 250.0).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 250.0).isActive = true
        imageView.contentMode = .scaleAspectFit
        
        //sum Label
        sumLabel = UILabel()
        guard let money = sumLabel else {return}
        view.addSubview(money)
        money.translatesAutoresizingMaskIntoConstraints = false
        money.font = textFontBig
        money.backgroundColor = UIColor.black
        money.textColor = UIColor.white
        money.layer.masksToBounds = true
        money.layer.cornerRadius = 10.0
        money.text = "1500" + " ₽"
        money.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20.0).isActive = true
        upConstraint = money.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20.0)
        downConstraint = money.topAnchor.constraint(equalTo: userLabel.bottomAnchor, constant: 20.0)
        downConstraint?.isActive = false
        upConstraint?.isActive = true
        money.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        money.textAlignment = .center
        money.widthAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 1).isActive = true
        

        // Number label
        numberLabel = UILabel()
        guard let lNum = numberLabel else {
            return
        }
        lNum.translatesAutoresizingMaskIntoConstraints = false
        lNum.text = "Уведомить по номеру телефона"
        lNum.font = textFontMedium
        view.addSubview(lNum)
        lNum.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        lNum.topAnchor.constraint(equalTo: money.bottomAnchor, constant: 40.0).isActive = true
        
        //uiswitch
        switchToNumber = UISwitch()
        guard let SW = switchToNumber else {
            return
        }
        view.addSubview(SW)
        
        SW.addTarget(self, action: #selector(switchButtonTapped), for: .valueChanged)
        SW.isOn = false
        SW.translatesAutoresizingMaskIntoConstraints = false
        SW.tintColor = UIColor.black
        SW.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        SW.topAnchor.constraint(equalTo: lNum.bottomAnchor, constant: 5.0).isActive = true
        
        //NumberNotification
        
        numberNotification = UITextField()
        guard let textField = numberNotification else { return }
        textField.placeholder = "Введите номер телефона"
        textField.delegate = self
        textField.font = textFontMedium
        textField.tintColor = UIColor.white
        textField.textAlignment = .center
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.masksToBounds = true
        textField.layer.cornerRadius = 4.0
        view.addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.centerXAnchor.constraint(lessThanOrEqualTo: view.centerXAnchor).isActive = true
        textField.topAnchor.constraint(equalTo: SW.bottomAnchor, constant: 10.0).isActive = true
        textField.widthAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 0.98).isActive = true
        textField.heightAnchor.constraint(equalToConstant: 35.0).isActive = true
        textField.isHidden = true
        
        //nextButton
        nextButton = UIButton(type: .system)
        guard let button = nextButton else {
            return
        }
        button.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        button.backgroundColor = UIColor.black
        button.tintColor = UIColor.white
        button.setTitle("Далее", for: .normal)
        button.titleLabel?.font = textFontBig
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 10.0
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 0.98).isActive = true
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.bottomAnchor.constraint(equalTo: self.view.layoutMarginsGuide.bottomAnchor, constant: 10.0).isActive = true
        
    }
    
    @objc private func nextButtonTapped() {
    }
    
    @objc private func switchButtonTapped() {
        if let textField = numberNotification {
            textField.isHidden = !textField.isHidden
            if let img = self.qrImageView {
                img.isHidden = !img.isHidden
                
                UIView.animate(withDuration: 0.5) {
                    self.upConstraint?.isActive = !img.isHidden
                    self.downConstraint?.isActive = img.isHidden
                    self.view.layoutIfNeeded()
                }
                
            }
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func generateQRCode(from string: String) -> UIImage? {
        let data = string.data(using: String.Encoding.ascii)
        
        if let filter = CIFilter(name: "CIQRCodeGenerator") {
            filter.setValue(data, forKey: "inputMessage")
            let transform = CGAffineTransform(scaleX: 3, y: 3)
            
            if let output = filter.outputImage?.transformed(by: transform) {
                return UIImage(ciImage: output)
            }
        }
        
        return nil
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
