//
//  Calculate.swift
//  BMIcalculator
//
//  Created by 순진이 on 2022/02/15.
//

import Foundation

struct Calculate {
    
    var bmi: BMI?

    mutating func calculateBMI(height: String, weight: String) {
        guard let heightValue = Float(height) else { return }
        guard let weightValue = Float(weight) else { return }
        let bmiValue = weightValue / (heightValue * heightValue) * 10000
        if bmiValue  < 18.5 {
            bmi = BMI(bmiValue: bmiValue, advice: "저체중")
            
        } else if bmiValue < 23 {
            bmi = BMI(bmiValue: bmiValue, advice: "정상")
        } else if bmiValue < 25 {
            bmi = BMI(bmiValue: bmiValue, advice: "과체중")
        } else {
            bmi = BMI(bmiValue: bmiValue, advice: "비만")
        }
        print(bmiValue)
        print(bmi!)
    }
    
    
    func getBmiValue() -> String {
        guard let safeValue = bmi?.bmiValue else { fatalError() }
        let bmiToDecimalPlace = String(format: "%.1f", safeValue / 10000)
        return bmiToDecimalPlace
    }
    
    func getAdvice() -> String {
        return bmi?.advice ?? "No Advice"
        
    }
}
