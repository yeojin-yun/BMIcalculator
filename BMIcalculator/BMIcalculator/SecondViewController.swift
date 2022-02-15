//
//  SecondViewController.swift
//  BMIcalculator
//
//  Created by 순진이 on 2022/02/11.
//

import UIKit

class SecondViewController: UIViewController {
    
    
    let resultLbl = MyLabel(title: "저체중", size: 50)
    let bmiLbl = MyLabel(title: "18.5")

    let rangeUnderWeight = MyLabel(title: "~18.5")
    let underweight = MyLabel(title: "저체중")
    
    let rangeNormalWeight = MyLabel(title: "18.5~")
    let normalWeight = MyLabel(title: "정상")
    
    let rangeOverWeight = MyLabel(title: "23~")
    let overWeight = MyLabel(title: "과제중")
    
    let rangeHeavyWeight = MyLabel(title: "25~")
    let heavyWeight = MyLabel(title: "비만")
    
    let recalcluateBtn = Mybutton(title: "다시 계산하기")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureUI()
    }
}



//MARK: -Event
extension SecondViewController {
    @objc func recalculateTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
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
        let bmi = BMI()
        print("📍: \(bmi.bmiValue)")
        resultLbl.text = String(bmi.advice)
        
        bmiLbl.text = String(bmi.bmiValue)
        
        [rangeUnderWeight, rangeNormalWeight, rangeOverWeight, rangeHeavyWeight].forEach {
            $0.backgroundColor = Color.myColor1
            $0.textColor = .white
        }
        
    }
    final private func addTarget() {
        recalcluateBtn.addTarget(self, action: #selector(recalculateTapped(_:)), for: .touchUpInside)
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
        
        let heavyStack = UIStackView(arrangedSubviews: [rangeHeavyWeight ,heavyWeight])
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
            recalcluateBtn.widthAnchor.constraint(equalToConstant: 350),
            
            rangeUnderWeight.widthAnchor.constraint(equalToConstant: 100),
            rangeNormalWeight.widthAnchor.constraint(equalTo: rangeUnderWeight.widthAnchor),
            rangeOverWeight.widthAnchor.constraint(equalTo: rangeUnderWeight.widthAnchor),
            rangeHeavyWeight.widthAnchor.constraint(equalTo: rangeUnderWeight.widthAnchor),
            
        ])
    }
}

