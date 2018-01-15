//
//  ViewController.swift
//  CalculatorApp
//
//  Created by Robert Wais on 1/15/18.
//  Copyright © 2018 Robert Wais. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var runningNumber = ""
    var currOperation = Operation.Empty
    var leftVal = ""
    var rightVal = ""
    var result = ""
    @IBOutlet var secondButton: UIButton!

    @IBOutlet var fristButton: UIButton!
    @IBOutlet var answerLabel: UILabel!
    
    enum Operation: String {
        case Addition = "+"
        case Divide = "/"
        case Multiply = "*"
        case Subtract = "-"
        case Empty = "Empty"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    @IBAction func numberPressed(sender:UIButton!){
        runningNumber += "\(sender.tag)"
        answerLabel.text = runningNumber
    }
    
    @IBAction func dividePressed(sender: AnyObject){
        detectOperation(operation: .Divide)
    }
    @IBAction func multiplyPressed(sender: AnyObject){
        detectOperation(operation: .Multiply)
    }
    
    @IBAction func subtractionPressed(sender: AnyObject){
        detectOperation(operation: .Subtract)
    }
    
    @IBAction func additionPressed(sender: AnyObject){
        detectOperation(operation: .Addition)
    }
    
    @IBAction func equalPressed(sender: AnyObject){
        print("Equation: \(leftVal) \(currOperation)  \(rightVal)")
        detectOperation(operation: currOperation)
    }
    
    
    
    //enum at top
    func detectOperation(operation: Operation){
        if currOperation != Operation.Empty {
            
            //A number key has been pressed before hand
            if runningNumber != ""{
                rightVal = runningNumber
                runningNumber = ""
                if currOperation == Operation.Addition {
                    result = "\(Double(leftVal)! + Double(rightVal)!)"
                } else if currOperation == Operation.Divide {
                    result = "\(Double(leftVal)! / Double(rightVal)!)"
                } else if currOperation == Operation.Subtract {
                    result = "\(Double(leftVal)! - Double(rightVal)!)"
                } else if currOperation == Operation.Multiply {
                    result = "\(Double(leftVal)! * Double(rightVal)!)"
                }
                leftVal = result
                answerLabel.text = result
        }
            currOperation = operation
        } else {
            leftVal = runningNumber
            runningNumber = ""
            currOperation = operation
        }
    }
}

