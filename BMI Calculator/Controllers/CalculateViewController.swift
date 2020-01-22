//
//  ViewController.swift
//  BMI Calculator


import UIKit

class CalculateViewController: UIViewController {
    
    
    //create a new object called calculatorBrain
    var calculatorBrain = CalculatorBrain()
    
    //    var bmiValue = "0.0" //show the bmi value in the next screen
    
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    
    
    @IBAction func hightSliderChange(_ sender: UISlider) {
        //round the value to 2 decimal places
        let height = String(format:"%.2f", sender.value)
        heightLabel.text = "\(height)m"
        
    }
    
    @IBAction func weightSliderChange(_ sender: UISlider) {
        //print whole number
        //1st way = String(format:"%.0f", sender.value)
        //2nd way = String(Int(sender.value))
        //convert float to integer(whole numbers with no decimal places)
        let weight = String(format:"%.0f", sender.value)
        
        weightLabel.text = "\(weight)Kg"
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        //for accessing the values we create IBOutlets for the two sliders
        let height = heightSlider.value
        let weight = weightSlider.value
        
        calculatorBrain.calculateBMI(height: height, weight: weight)
        
        
        //BMI = Weight(kg)/Height(m)2
        //pow(height, 2) = (height * height)
        
        //let bmi = weight / pow(height, 2)
        //rounding the bmi to a whole number
        //bmiValue = String(format: "%.1f" ,bmi)//show the bmi value in the next screen
        
        //navigate to the next screen
        //goToResult is the segue identifier
        self.performSegue(withIdentifier: "goToResult", sender: self)
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController //go to the next page
            destinationVC.bmiValue = calculatorBrain.getBMIValue()
            destinationVC.advice = calculatorBrain.getAdvice()
            destinationVC.color = calculatorBrain.getColor()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    
}

