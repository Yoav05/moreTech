//
//  ViewController.swift
//  moreTech
//
//  Created by Yoav on 14/09/2019.
//  Copyright © 2019 Yoav. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    private let eventCellIdentifier = "eventCell"
    private let cellSpacingHeight: CGFloat = 15
    private let cellHeight: CGFloat = 150
    
    private var eventsTable: UITableView = {
        return UITableView.init(frame: CGRect.zero, style: .plain)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.red
        
        setupUI()
    }

    
    private func setupUI() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(someAction))
        
        
        eventsTable.register(EventCell.self, forCellReuseIdentifier: eventCellIdentifier)
        eventsTable.dataSource = self
        eventsTable.delegate = self
        eventsTable.separatorStyle = .none
        view.addSubview(eventsTable)
        
        eventsTable.translatesAutoresizingMaskIntoConstraints = false
        let constraints: [NSLayoutConstraint] =
            [
                eventsTable.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                eventsTable.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                eventsTable.topAnchor.constraint(equalTo: view.topAnchor),
                eventsTable.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ]
        
        self.view.addConstraints(constraints)
    }
    
    @objc private func someAction(){
        NetworkManager().registrate(id: "234123rfdwfwe3443r43r32r4322"){id, error in
                print(id!)
        }
    }
    
    //MARK: TableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: eventCellIdentifier, for: indexPath)
        return cell
    }
    
    //MARK: TableViewDelegate
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return cellSpacingHeight
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }

}

