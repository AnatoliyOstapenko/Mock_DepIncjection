//
//  InitialCell.swift
//  Mock_DepIncjection
//
//  Created by AnatoliiOstapenko on 06.08.2022.
//

import UIKit

class InitialCell: UITableViewCell {
    
    static let reuseID = "InitialCell"
    let cellLabel = CustomLabel(font: .systemFont(ofSize: 20))
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        contentView.setCellLabel(view: contentView, label: cellLabel)
    }
    
    func updateInitialCell(user: String) {
        cellLabel.text = user
    }

}
