//
//  SecondViewController.swift
//  BMIcalculator
//
//  Created by 순진이 on 2022/02/11.
//

import UIKit

class SecondViewController: UIViewController {
    
    let resultLbl = UILabel()
    let bmiLbl = UILabel()

    let rangeUnderWeight = MyLabel(title: "~18.5")
    let underweight = MyLabel(result: "저체중")
    
    let rangeNormalWeight = MyLabel(title: "18.5~")
    let normalWeight = MyLabel(result: "정상")
    
    let rangeOverWeight = MyLabel(title: "23~")
    let overWeight = MyLabel(result: "과제중")
    
    let rangeHeaveWeight = MyLabel(title: "25~")
    let heavyWeight = MyLabel(result: "비만")
    
    let recalcluateBtn = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureUI()
    }
}

//MARK: -UI
extension SecondViewController {
    final private func configureUI() {
        setAttributes()
        addTarget()
        setConstraints()
    }
    
    final private func setAttributes() {
        resultLbl.text = "저체중"
        bmiLbl.text = "18.4"
        
        [recalcluateBtn].forEach {
            $0.setTitle("다시 계산하기", for: .normal)
            $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 40)
            $0.backgroundColor = Color.myColor1
            $0.setTitleColor(.white, for: .normal)
            $0.layer.cornerRadius = 20
        }
        
        
    }
    final private func addTarget() {
        
    }
    
    final private func setConstraints() {
        let topStack = UIStackView(arrangedSubviews: [resultLbl, bmiLbl])
        topStack.axis = .vertical
        //topStack.distribution = .fillEqually
        topStack.spacing = 10
        
        let underStack = UIStackView(arrangedSubviews: [rangeUnderWeight ,underweight])
        underStack.axis = .horizontal
        underStack.spacing = 15
        
        let normalStack = UIStackView(arrangedSubviews: [rangeNormalWeight ,normalWeight])
        normalStack.axis = .horizontal
        normalStack.spacing = 15
        
        let overStack = UIStackView(arrangedSubviews: [rangeOverWeight ,overWeight])
        overStack.axis = .horizontal
        overStack.spacing = 15
        
        let heavyStack = UIStackView(arrangedSubviews: [rangeHeaveWeight ,heavyWeight])
        heavyStack.axis = .horizontal
        heavyStack.spacing = 15
        
        [topStack, underStack, normalStack, overStack, heavyStack, recalcluateBtn].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            topStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            topStack.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            
            underStack.topAnchor.constraint(equalTo: topStack.bottomAnchor, constant: 50),
            underStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            
            normalStack.topAnchor.constraint(equalTo: underStack.bottomAnchor, constant: 50),
            normalStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            
            overStack.topAnchor.constraint(equalTo: normalStack.bottomAnchor, constant: 50),
            overStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            
            heavyStack.topAnchor.constraint(equalTo: overStack.bottomAnchor, constant: 50),
            heavyStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            
            
            recalcluateBtn.topAnchor.constraint(equalTo: heavyStack.bottomAnchor, constant: 100),
            recalcluateBtn.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
        ])
    }
}

