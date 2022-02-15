//
//  MyLabel.swift
//  BMIcalculator
//
//  Created by 순진이 on 2022/02/12.
//

import UIKit

class MyLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    init(title: String, size: CGFloat = 25) {
        super.init(frame: CGRect(x: 0, y: 0, width: 100, height: 0))
        font = UIFont(name: "SongMyung-Regular", size: size)
        layer.cornerRadius = 30
        text = title
        textAlignment = .center
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

