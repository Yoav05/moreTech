//
//  LoginViewController.swift
//  moreTech
//
//  Created by Yoav on 14/09/2019.
//  Copyright © 2019 Yoav. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    private var loginButton: UIButton?
    private var loginLabel: UILabel?
    private var loginTextField: UITextField?
    private var mainVC: ViewController?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        setupUI()

        // Do any additional setup after loading the view.
    }
    
    
    private func setupUI() {
        title = "Авторизация"
        guard let txtFontlarge = textFontLarge else { return }
        guard let txtFontMedium = textFontMedium else { return }

        self.navigationController?.navigationBar.titleTextAttributes =
            [NSAttributedString.Key.foregroundColor: UIColor.red,
             NSAttributedString.Key.font: txtFontMedium]
        //Label
        loginLabel = UILabel()
        guard let logLabel = loginLabel else { return }
        view.addSubview(logLabel)
        logLabel.text = "Введите свой ID"
        logLabel.textAlignment = .center
        logLabel.font = textFontBig
        logLabel.backgroundColor = backgroundLabelColor
        logLabel.layer.masksToBounds = true
        logLabel.layer.cornerRadius = labelLayerCornerRadius
        logLabel.translatesAutoresizingMaskIntoConstraints = false
        logLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        logLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 150.0).isActive = true
        logLabel.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.7).isActive = true
        //TextField
        
        loginTextField = UITextField()
        guard let textField = loginTextField else { return }
        textField.font = textFontBig
        textField.placeholder = "ID"
        textField.backgroundColor = backgroundLabelColor
        
        view.addSubview(textField)
        textField.layer.masksToBounds = true
        textField.layer.cornerRadius = labelLayerCornerRadius
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.topAnchor.constraint(equalTo: logLabel.bottomAnchor, constant: 10).isActive = true
        textField.widthAnchor.constraint(equalTo: logLabel.widthAnchor, multiplier: 0.9).isActive = true
        textField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        //Button
        
        loginButton = UIButton(type: .system)
        guard let button = loginButton else { return }
        button.setTitle("Зайти", for: .normal)
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        button.backgroundColor = UIColor.black
        button.tintColor = backgroundLabelColor
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = textFontBig
        button.layer.cornerRadius = labelLayerCornerRadius
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        button.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.8).isActive = true
        button.bottomAnchor.constraint(equalTo: self.view.layoutMarginsGuide.bottomAnchor, constant: -20.0).isActive = true
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @objc private func loginButtonTapped() {
        let defaults = UserDefaults.standard
        if let idText = loginTextField?.text {
            defaults.set(idText, forKey: userDefaultsID)
        }
        
        self.dismiss(animated: true, completion: nil)
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
