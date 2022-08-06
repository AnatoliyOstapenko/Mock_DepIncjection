//
//  UIView_Ext.swift
//  Mock_DepIncjection
//
//  Created by AnatoliiOstapenko on 06.08.2022.
//

import UIKit

private let padding: CGFloat = 4

extension UIView {
    
    // MARK: - InitialVC
    
    func setInitialTableView(view: UIView, tableView: UITableView, vc: UIViewController) {
        tableView.backgroundColor = .systemBackground
        view.addSubview(tableView)
        tableView.register(InitialCell.self, forCellReuseIdentifier: InitialCell.reuseID)
        tableView.dataSource = vc as? InitialVC
        tableView.delegate = vc as? InitialVC
        tableView.frame = view.bounds
    }
    
    // MARK: - InitialCell
    
    func setCellLabel(view: UIView, label: UILabel) {
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: padding),
            label.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -padding)
        ])
        
    }
    
}
