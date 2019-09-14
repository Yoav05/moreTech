//
//  LoginViewController.swift
//  moreTech
//
//  Created by Yoav on 14/09/2019.
//  Copyright © 2019 Yoav. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    private var loginButton: UIButton?
    private var loginLabel: UILabel?
    private var loginTextField: UITextField?
    private var mainVC: ViewController?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        logLabel.font = txtFontlarge
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
        textField.font = textFontMedium
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
        button.titleLabel?.font = txtFontMedium
        button.layer.cornerRadius = labelLayerCornerRadius
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        button.widthAnchor.constraint(equalToConstant: 80).isActive = true
        button.heightAnchor.constraint(equalToConstant: 35).isActive = true
        button.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 20.0).isActive = true
        
    }
    
    @objc private func loginButtonTapped() {
        mainVC = ViewController()
        if let vc = mainVC {
            //navigationController?.pushViewController(EventViewController(), animated: true)
            self.present(EventViewController(), animated: true, completion: nil)
        }
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
