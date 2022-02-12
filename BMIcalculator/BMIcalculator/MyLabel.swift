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
    

    init(title: String) {
        super.init(frame: CGRect(x: 0, y: 0, width: 70, height: 50))
        text = title
        textAlignment = .center
        font = UIFont.systemFont(ofSize: 25)
        backgroundColor = Color.myColor1
        textColor = .white
    }
    
    init(result: String) {
        super.init(frame: .zero)
        text = result
        textAlignment = .center
        font = UIFont.systemFont(ofSize: 25)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
