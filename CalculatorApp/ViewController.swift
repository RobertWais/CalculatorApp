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
    var isDecimal = false
    
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
        let tag = sender.tag
        if tag == 20 && isDecimal == false {
            runningNumber += "."
            isDecimal = true
        }else if tag != 20{
        runningNumber += "\(sender.tag)"
        }
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
        detectOperation(operation: currOperation)
    }
    

    @IBAction func clearPressed(sender: AnyObject){
        rightVal = ""
        leftVal = ""
        runningNumber = ""
        currOperation = Operation.Empty
        answerLabel.text = "0"
        isDecimal = false
        
    }
    
    
    
    //enum at top
    func detectOperation(operation: Operation){
        isDecimal = false
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

