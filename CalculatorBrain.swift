//
//  CalculatorBrain.swift
//  BMI Calculator

/*
 BMI Categories
 Underwight =<18.5
 Normal weight = 18.5-24.9
 Overweight =25
 */

import UIKit

struct CalculatorBrain {
    
    var bmi: BMI? //BMI Struct
    
    func getBMIValue() -> String{
        //bmi ?? 0.0 =>nil Coalescing Operator = if bmi is nill,show the default value of 0.0
        let bmiTo1DecimalPlace = String(format: "%.1f" ,bmi?.value ?? 0.0)
        return bmiTo1DecimalPlace
    }
    
    mutating func calculateBMI(height: Float, weight: Float){
        //BMI = Weight(kg)/Height(m)2
        //pow(height, 2) = (height * height)
        
        let bmiValue = weight / pow(height, 2)
        
        if bmiValue < 18.5{
            bmi = BMI(value: bmiValue, advice: "Eat more pies.", color: #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1))//bmi struct
        }else if bmiValue < 24.9{
            bmi = BMI(value: bmiValue, advice: "Fit as a fiddle!", color: #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1))
        }else{
            bmi = BMI(value: bmiValue, advice: "Eat less pies!", color: #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1))
        }
    }
    
    
    //Advice
    func getAdvice() -> String{
        //Coalescing Operator = if bmi is nill,show the default value of "No advice."
        return bmi?.advice ?? "No advice."
    }
    
    //Color
    func getColor() -> UIColor{
        //Coalescing Operator = if bmi is nill,show the default color of white.
        return bmi?.color ?? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    
    
}
