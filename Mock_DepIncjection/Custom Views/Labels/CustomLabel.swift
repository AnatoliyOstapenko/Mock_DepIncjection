//
//  CustomLabel.swift
//  Mock_DepIncjection
//
//  Created by AnatoliiOstapenko on 06.08.2022.
//

import UIKit

class CustomLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    convenience init(font: UIFont) {
        self.init(frame: .zero)
        self.font = font
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        backgroundColor = .systemBackground
        layer.cornerRadius = 10
        layer.borderWidth = 1
        layer.borderColor = UIColor.systemPink.cgColor
        textAlignment = .center
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.7
        translatesAutoresizingMaskIntoConstraints = false
    }
}
