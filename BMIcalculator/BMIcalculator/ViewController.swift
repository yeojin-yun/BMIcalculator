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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
        mainLbl.text = "나의 체질량 지수"
        bmiLbl.text = "BMI"
        heightLbl.text = "키"
        weightLbl.text = "몸무게"
    }
    
    final private func addTarget() {
        
    }
    
    final private func setConstraints() {
        
    }
}

