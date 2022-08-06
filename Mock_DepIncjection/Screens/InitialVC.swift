//
//  InitialVC.swift
//  Mock_DepIncjection
//
//  Created by AnatoliiOstapenko on 06.08.2022.
//

import UIKit

class InitialVC: UIViewController {
    
    let initialTableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        view.setInitialTableView(view: view, tableView: initialTableView)
        initialTableView.register(InitialCell.self, forCellReuseIdentifier: InitialCell.reuseID)
        
    }
}
