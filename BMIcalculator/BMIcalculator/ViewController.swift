//
//  ViewController.swift
//  BMIcalculator
//
//  Created by 순진이 on 2022/02/09.
//

import UIKit

class ViewController: UIViewController {
    
    let mainLbl = UILabel()
    let bmiLbl = UILabel()
    let heightLbl = UILabel()
    let weightLbl = UILabel()
    let heightTextField = UITextField()
    let weightTextField = UITextField()
    let calculateBtn = UIButton()
    
    let MyColor = UIColor(red: 137.0 / 255.0, green: 70.0 / 255.0, blue: 166.0 / 255.0, alpha: 1.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }


}

//MARK: -Event
extension ViewController {
    @objc func btnTapped(_ sender: UIButton) {
        let secondVC = SecondViewController()
        secondVC.modalPresentationStyle = .popover
        self.present(secondVC, animated: true, completion: nil)
        
    }
}

//MARK: -UI
extension ViewController {
    final private func configureUI() {
        setAttributes()
        addTarget()
        setConstraints()
    }
    
    final private func setAttributes() {
        [mainLbl].forEach {
            $0.text = "나의 체질량 지수"
            $0.font = UIFont.boldSystemFont(ofSize: 40)
            $0.textAlignment = .center
        }
        [bmiLbl].forEach {
            $0.text = "BMI"
            $0.font = UIFont.boldSystemFont(ofSize: 20)
            $0.textAlignment = .center
            $0.textColor = .white
            $0.backgroundColor = MyColor
        }
        
        [heightLbl, weightLbl].forEach {
            $0.font = UIFont.systemFont(ofSize: 30)
            $0.textAlignment = .center
        }
        heightLbl.text = "키(cm)"
        weightLbl.text = "몸무게(kg)"
        
        [weightTextField, heightTextField].forEach {
            $0.placeholder = "입력"
            
            $0.borderStyle = .roundedRect
        }

        
        [calculateBtn].forEach {
            $0.setTitle("계산", for: .normal)
            $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 40)
            $0.backgroundColor = MyColor
            $0.setTitleColor(.white, for: .normal)
            $0.layer.cornerRadius = 20
        }
    }
    
    final private func addTarget() {
        calculateBtn.addTarget(self, action: #selector(btnTapped(_:)), for: .touchUpInside)
    }
    
    final private func setConstraints() {
        let topStack = UIStackView(arrangedSubviews: [mainLbl, bmiLbl])
        topStack.axis = .vertical
        //topStack.distribution = .fillEqually
        topStack.spacing = 10
        
        let leftStack = UIStackView(arrangedSubviews: [heightLbl, heightTextField])
        leftStack.axis = .vertical
        leftStack.distribution = .fillEqually
        leftStack.spacing = 10
        
        let rightStack = UIStackView(arrangedSubviews: [weightLbl, weightTextField])
        rightStack.axis = .vertical
        rightStack.distribution = .fillEqually
        rightStack.spacing = 10
        
        [topStack, leftStack, rightStack, calculateBtn].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            topStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 150),
            topStack.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            
            leftStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 60),
            leftStack.topAnchor.constraint(equalTo: topStack.bottomAnchor, constant: 120),
            
            rightStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -60),
            rightStack.topAnchor.constraint(equalTo: topStack.bottomAnchor, constant: 120),
            
            calculateBtn.topAnchor.constraint(equalTo: rightStack.bottomAnchor, constant: 120),
            calculateBtn.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            calculateBtn.widthAnchor.constraint(equalToConstant: 150)
        ])
    }
}

