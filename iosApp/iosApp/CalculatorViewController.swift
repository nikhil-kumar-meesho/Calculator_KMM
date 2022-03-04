//
//  CalculatorViewController.swift
//  iosApp
//
//  Created by Nikhil Kumar on 04/03/22.
//  Copyright © 2022 orgName. All rights reserved.
//

import UIKit
import shared


class CalculatorViewController: UIViewController {

    let calculatorScreen: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .gray
        return view
    }()
    
    let numberOne: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Number 1"
        return view
    }()
    
    let numberTwo: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Number 2"
        return view
    }()
    
    let numberOneTextField: UITextField = {
        let view = UITextField()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "0"
        return view
    }()
    
    let numberTwoTextField: UITextField = {
        let view = UITextField()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "0"
        return view
    }()
    
    let AddButton: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setTitle(" AddButton ", for: .normal)
        view.backgroundColor = .gray
        view.addTarget(self, action: #selector(tapped), for: .touchUpInside)
        view.layer.cornerRadius = 12
        return view
    }()
    
    @objc func tapped(){
        calculatorScreen.text = BasicCalculatorFunctions().Addition(a: numberOneTextField.text!,b: numberTwoTextField.text!)
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        // Do any additional setup after loading the view.
    }
    
    func setupViews(){
        view.addSubview(calculatorScreen)
        calculatorScreen.text = Greeting().greeting()
        NSLayoutConstraint.activate([
            calculatorScreen.topAnchor.constraint(equalTo: view.topAnchor, constant: 32),
            calculatorScreen.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 8),
            calculatorScreen.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8)
        ])
        
        view.addSubview(numberOne)
        NSLayoutConstraint.activate([
            numberOne.topAnchor.constraint(equalTo: calculatorScreen.bottomAnchor, constant: 16),
            numberOne.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8)
        ])
        
        view.addSubview(numberOneTextField)
        NSLayoutConstraint.activate([
            numberOneTextField.topAnchor.constraint(equalTo: calculatorScreen.bottomAnchor, constant: 16),
            numberOneTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -48)
        ])
        
        view.addSubview(numberTwoTextField)
        NSLayoutConstraint.activate([
            numberTwoTextField.topAnchor.constraint(equalTo: numberOne.bottomAnchor, constant: 16),
            numberTwoTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -48)
        ])
        
        
        view.addSubview(numberTwo)
        NSLayoutConstraint.activate([
            numberTwo.topAnchor.constraint(equalTo: numberOne.bottomAnchor, constant: 16),
            numberTwo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8)
        ])
        
        view.addSubview(AddButton)
        NSLayoutConstraint.activate([
            AddButton.topAnchor.constraint(equalTo: numberTwo.bottomAnchor, constant: 16),
            AddButton.centerXAnchor.constraint(equalTo: view.centerXAnchor,constant: 0),
           // AddButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8)
        ])
        
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
