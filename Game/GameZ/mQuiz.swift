//
//  ViewController.swift
//  Gamez
//
//  Created by SHAGUN  on 10/18/16.
//  Copyright © 2016 SHAGUN . All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {
    
    
    @IBOutlet weak var label_ques: UILabel!
    @IBOutlet weak var label_ans: UILabel!
    @IBAction func playAgain(sender: UIButton) {
        question()
        
        solution()
        
        textField.text=nil
        
        label_ans!.text=nil
        
        ansFieldNormalState()
        
        textField.resignFirstResponder()
        
    }
    
    @IBOutlet weak var textField: UITextField!
    @IBAction func Submit(sender: UIButton) {
        submitHit()
        
        textField.resignFirstResponder()
        
        
    }
    var answer: Int?{
        didSet{
            changeAnswerLabel(label_ans!)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        ansFieldNormalState()
        question()
        textField.delegate = self
        label_ans?.textColor = UIColor.clearColor()
        textField.keyboardType = UIKeyboardType.NumbersAndPunctuation
    }
    var num: Int = 0
    var num1: Int = 0
    var num2: Int = 0
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        submitHit()
        textField.resignFirstResponder()
        return true
    }
    func submitHit(){
        if let text = textField.text, let value = Int(text){
            answer = value;
        }
        else{
            answer = nil
            ansFieldNormalState()
            label_ans?.textColor = UIColor.clearColor()
        }
        
    }
    func randomOperatorgenerator()-> String{
        let operator_array = ["+", "-", "X"]
        num = Int(arc4random_uniform(3))
        return operator_array[num]
    }
    func question(){
        num1 = Int(arc4random_uniform(10) + 1)
        num2 = Int(arc4random_uniform(10) + 1)
        label_ques?.text = "\(num1) \(randomOperatorgenerator()) \(num2)"
        
    }
    func solution() -> Int{
        var solution: Int?
        
        switch num {
        case 0:
            solution = (num1 + num2)
        case 1:
            solution = (num1 - num2)
        case 2:
            solution = (num1 * num2)
        default:
            solution = 0
        }
        print(solution)
        return solution!
    }
    
    func ansFieldNormalState(){
        textField.placeholder = "Answer"
        
        textField.textColor = UIColor.grayColor()
    }
    
    
    
    func changeAnswerLabel(ansLabel: UILabel){
        if(answer == solution()){
            ansLabel.text = "CORRECT"
            ansLabel.textColor = UIColor.greenColor()
        }
        else{
            ansLabel.text = "INCORRECT"
            ansLabel.textColor = UIColor.redColor()
        }
    }
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        //        print("Current text = \(textField.text)")
        //        print("Replacement text = \(string)")
        
        let existingTextHasDecimalPoint = textField.text!
        let replacementTextHasDecimalPoint = string.rangeOfString("0")
        
        if existingTextHasDecimalPoint.isEmpty && replacementTextHasDecimalPoint != nil && !(answer==0){
            return false
        }
        return true
        
    }
}






