//
//  ViewController.swift
//  BMIcalculator
//
//  Created by 순진이 on 2022/02/09.
//

import UIKit



class ViewController: UIViewController {
    
    var calculate = Calculate()
    
    let mainLbl = UILabel()
    let bmiLbl = UILabel()
    let healthImg = UIImageView()
    let heightLbl = MyLabel(title: "키(cm)", size: 25)
    let weightLbl = MyLabel(title: "몸무게(kg)", size: 25)
    let heightTextField = UITextField()
    let weightTextField = UITextField()
    let calculateBtn = Mybutton(title: "BMI 계산")
    
    override func viewWillAppear(_ animated: Bool) {
        heightTextField.placeholder = "키 입력"
        weightTextField.placeholder = "몸무게 입력"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        heightTextField.delegate = self
        weightTextField.delegate = self
    }


}

//MARK: -UITextDelegate
extension ViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

//MARK: -Event
extension ViewController {
    @objc func btnTapped(_ sender: UIButton) {
        let secondVC = SecondViewController()
        secondVC.modalPresentationStyle = .fullScreen
        
        self.present(secondVC, animated: true, completion: nil)
        
        guard let height = heightTextField.text else { return }
        guard let weight = weightTextField.text else { return }
        
        calculate.calculateBMI(height: height, weight: weight)
        
        secondVC.bmiValue = calculate.getBmiValue()
        secondVC.advice = calculate.getAdvice()
        
        heightTextField.text = ""
        weightTextField.text = ""
        print("🙏🏻: \(secondVC.bmiValue), \(secondVC.advice)")
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
            $0.textAlignment = .center
            $0.font = UIFont(name: "SongMyung-Regular", size: 40)
        }
        
        [bmiLbl].forEach {
            $0.text = "BMI"
            $0.font = UIFont.boldSystemFont(ofSize: 20)
            $0.textAlignment = .center
            $0.textColor = .white
            $0.backgroundColor = Color.myColor1
        }
        
        [weightTextField, heightTextField].forEach {
            $0.keyboardType = .decimalPad
            $0.borderStyle = .roundedRect
        }
        healthImg.image = UIImage(named: "power.png")
        healthImg.contentMode = .scaleAspectFit
    }
    
    final private func addTarget() {
        calculateBtn.addTarget(self, action: #selector(btnTapped(_:)), for: .touchUpInside)
    }
    
    final private func setConstraints() {
        let topStack = UIStackView(arrangedSubviews: [mainLbl, bmiLbl])
        topStack.axis = .vertical
        topStack.spacing = 10
        
        let leftStack = UIStackView(arrangedSubviews: [heightLbl, heightTextField])
        leftStack.axis = .vertical
        leftStack.distribution = .fillEqually
        leftStack.spacing = 10
        
        let rightStack = UIStackView(arrangedSubviews: [weightLbl, weightTextField])
        rightStack.axis = .vertical
        rightStack.distribution = .fillEqually
        rightStack.spacing = 10
        
        [topStack, leftStack, rightStack, healthImg, calculateBtn].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            topStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 150),
            topStack.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            
            healthImg.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 60),
            healthImg.topAnchor.constraint(equalTo: topStack.bottomAnchor, constant: 20),
            healthImg.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -60),
            healthImg.bottomAnchor.constraint(equalTo: leftStack.topAnchor, constant: -20),
            
            leftStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 60),
            leftStack.topAnchor.constraint(equalTo: topStack.bottomAnchor, constant: 230),
            heightTextField.widthAnchor.constraint(equalToConstant: 130),
            
            rightStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -60),
            rightStack.topAnchor.constraint(equalTo: topStack.bottomAnchor, constant: 230),
            weightTextField.widthAnchor.constraint(equalTo: heightTextField.widthAnchor),
            
            calculateBtn.topAnchor.constraint(equalTo: rightStack.bottomAnchor, constant: 50),
            calculateBtn.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            calculateBtn.widthAnchor.constraint(equalToConstant: 250)
        ])
    }
}

