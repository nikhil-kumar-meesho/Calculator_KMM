//
//  NewCalculatorViewController.swift
//  iosApp
//
//  Created by Nikhil Kumar on 07/03/22.
//  Copyright © 2022 orgName. All rights reserved.
//

import UIKit
import shared

class NewCalculatorViewController: UIViewController {

    private var resultLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textColor = .black
        label.textAlignment = .right
        label.font = UIFont(name: "Helvetica", size: 100)
        return label
    }()
    
   var newCalculatorFunction =  NewCalculatorFunctions()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNumberPad()
    }
    
    private func setupNumberPad() {
            let buttonSize: CGFloat = view.frame.size.width / 4

            let zeroButton = UIButton(frame: CGRect(x: 0, y: view.frame.size.height-buttonSize, width: buttonSize*3, height: buttonSize))
            zeroButton.setTitleColor(.black, for: .normal)
            zeroButton.backgroundColor = .white
            zeroButton.setTitle("0", for: .normal)
            zeroButton.tag = 1
            view.addSubview(zeroButton)

            zeroButton.addTarget(self, action: #selector(zeroTapped), for: .touchUpInside)

            for x in 0..<3 {
                let button1 = UIButton(frame: CGRect(x: buttonSize * CGFloat(x), y: view.frame.size.height-(buttonSize*2), width: buttonSize, height: buttonSize))
                button1.setTitleColor(.black, for: .normal)
                button1.backgroundColor = .white
                button1.setTitle("\(x+1)", for: .normal)
                view.addSubview(button1)
                button1.tag = x+2
                button1.addTarget(self, action: #selector(numberPressed(_:)), for: .touchUpInside)
            }

            for x in 0..<3 {
                let button2 = UIButton(frame: CGRect(x: buttonSize * CGFloat(x), y: view.frame.size.height-(buttonSize*3), width: buttonSize, height: buttonSize))
                button2.setTitleColor(.black, for: .normal)
                button2.backgroundColor = .white
                button2.setTitle("\(x+4)", for: .normal)
                view.addSubview(button2)
                button2.tag = x+5
                button2.addTarget(self, action: #selector(numberPressed(_:)), for: .touchUpInside)
            }

            for x in 0..<3 {
                let button3 = UIButton(frame: CGRect(x: buttonSize * CGFloat(x), y: view.frame.size.height-(buttonSize*4), width: buttonSize, height: buttonSize))
                button3.setTitleColor(.black, for: .normal)
                button3.backgroundColor = .white
                button3.setTitle("\(x+7)", for: .normal)
                view.addSubview(button3)
                button3.tag = x+8
                button3.addTarget(self, action: #selector(numberPressed(_:)), for: .touchUpInside)
            }

            let clearButton = UIButton(frame: CGRect(x: 0, y: view.frame.size.height-(buttonSize*5), width: view.frame.size.width - buttonSize, height: buttonSize))
            clearButton.setTitleColor(.black, for: .normal)
            clearButton.backgroundColor = .white
            clearButton.setTitle("Clear ALL", for: .normal)
            view.addSubview(clearButton)


            let operations = ["=","+", "-", "x", "/"]

            for x in 0..<5 {
                let button4 = UIButton(frame: CGRect(x: buttonSize * 3, y: view.frame.size.height-(buttonSize * CGFloat(x+1)), width: buttonSize, height: buttonSize))
                button4.setTitleColor(.white, for: .normal)
                button4.backgroundColor = .orange
                button4.setTitle(operations[x], for: .normal)
                view.addSubview(button4)
                button4.tag = x+1
                button4.addTarget(self, action: #selector(operationPressed(_:)), for: .touchUpInside)
            }

            resultLabel.frame = CGRect(x: 20, y: clearButton.frame.origin.y - 110.0, width: view.frame.size.width - 40, height: 100)
            view.addSubview(resultLabel)

            // Actions
            clearButton.addTarget(self, action: #selector(clearResult), for: .touchUpInside)
        }
    
    
    @objc func clearResult() {
        resultLabel.text = newCalculatorFunction.clearResult()
    }
    
    @objc func zeroTapped() {
        resultLabel.text = newCalculatorFunction.zeroTapped()
    }
    
    @objc func numberPressed(_ sender: UIButton) {
        resultLabel.text = newCalculatorFunction.numberPressed(tag: "\(sender.tag)")
    }
    
    @objc func operationPressed(_ sender: UIButton) {
        resultLabel.text = newCalculatorFunction.operationPressed(tag: "\(sender.tag)")
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
