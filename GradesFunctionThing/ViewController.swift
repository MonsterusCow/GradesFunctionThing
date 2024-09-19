//
//  ViewController.swift
//  GradesFunctionThing
//
//  Created by RYAN STARK on 9/19/24.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate{

    @IBOutlet weak var pointsField: UITextField!
    @IBOutlet weak var totalPoints: UITextField!
    @IBOutlet weak var percentageField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pointsField.delegate = self
        totalPoints.delegate = self
        percentageField.delegate = self
        // Do any additional setup after loading the view.
    }


    
    @IBAction func calculate(_ sender: UIButton) {
        if Double((pointsField.text?.replacingOccurrences(of: " ", with: ""))!) != nil && Double(totalPoints.text!) != nil{
            if Double(pointsField.text!)! > 0.0 && Double(totalPoints.text!)! > 0.0{
                if ifPassed(num1: Double(pointsField.text!)!, num2: Double(totalPoints.text!)!){
                    results(alertName: "Good job you passed")
                } else {
                    results(alertName: "You did not pass (boooo)")
                }
            } else {
                nuhUH(alertName: "No negatives")
            }
        } else {
            nuhUH(alertName: "Put numbers")
        }
    }
    
    
    @IBAction func getLetterButton(_ sender: UIButton) {
        if Double((percentageField.text?.replacingOccurrences(of: " ", with: ""))!) != nil {
            if Double(percentageField.text!)! > 0.0 {
                let percent = Double(percentageField.text!)!
                let letter = getLetter(num1: percent)
                results(alertName: "You got a \(letter)")
            } else {
                nuhUH(alertName: "No negatives")
            }
        } else {
            nuhUH(alertName: "Put a percent first")
        }
    }
    
    @IBAction func getBothButton(_ sender: UIButton) {
        if Double((pointsField.text?.replacingOccurrences(of: " ", with: ""))!) != nil && Double(totalPoints.text!) != nil{
            if Double(pointsField.text!)! > 0.0 && Double(totalPoints.text!)! > 0.0{
                var tuplee = doItAll(num1: Double(pointsField.text!)!, num2: Double(totalPoints.text!)!)
                results(alertName: "You got a \(tuplee.0)% and that is a \(tuplee.1)")
            } else {
                nuhUH(alertName: "No negatives")
            }
        } else {
            nuhUH(alertName: "Put numbers")
        }
        
    }
    
    //MVP
    func ifPassed(num1: Double, num2: Double)-> Bool{
        if (num1/num2)*100 > 50 {
            print(num1)
            print(num2)
            return true
        } else {
            print(num1)
            print(num2)
            return false
        }
    }
    
    //Stretch 1
    func getLetter(num1: Double)-> String{
        var returnthing = ""
        if num1 >= 100.0{
            returnthing = "A+"
        } else if num1 >= 90.0 {
            returnthing = "A"
        } else if num1 >= 80.0 {
            returnthing = "B"
        } else if num1 >= 70.0 {
            returnthing = "C"
        } else if num1 >= 60.0 {
            returnthing = "D"
        } else if num1 < 60.0 {
            returnthing = "F"
        }
        return returnthing
    }
    
    //Stretch 2
    func doItAll(num1: Double, num2: Double)-> (String, String){
        var percent = (num1/num2)*100
        var rounded = String(format: "%.2f", percent)
        var letter = getLetter(num1: percent)
        return (rounded, letter)
    }
    

    
    
    func results(alertName: String)
        {
            let alert = UIAlertController(title: "Results", message: alertName, preferredStyle: UIAlertController.Style.alert)
            let alertAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
            
            alert.addAction(alertAction)
            
            self.present(alert, animated: true)
        }
    func nuhUH(alertName: String)
        {
            let alert = UIAlertController(title: "Error", message: alertName, preferredStyle: UIAlertController.Style.alert)
            let alertAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
            
            alert.addAction(alertAction)
            
            self.present(alert, animated: true)
        }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        pointsField.resignFirstResponder()
        totalPoints.resignFirstResponder()
        return percentageField.resignFirstResponder()
    }
}

