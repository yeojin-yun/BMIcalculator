//
//  MyButton.swift
//  BMIcalculator
//
//  Created by 순진이 on 2022/02/13.
//

import UIKit

class Mybutton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(title: String) {
        super.init(frame: .zero)
        setTitle(title, for: .normal)
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 40)
        backgroundColor = Color.myColor1
        setTitleColor(.white, for: .normal)
        layer.cornerRadius = 20
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
