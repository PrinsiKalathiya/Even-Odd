//
//  ViewController.swift
//  evenodd
//
//  Created by DCS on 15/06/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private let myTextField:UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Number"
        textField.textAlignment = .center
        textField.borderStyle = .line
        textField.backgroundColor = UIColor.white
        return textField
    }()
    
    private let myButton:UIButton = {
        let btn = UIButton()
        btn.setTitle("Check", for: .normal)
        btn.addTarget(self, action: #selector(checkEvenOdd), for: .touchUpInside)
        btn.backgroundColor = UIColor.darkGray
        btn.layer.cornerRadius = 5
        btn.layer.borderWidth = 4
        return btn
    }()
    
    @objc private func checkEvenOdd() {
        print("checking..")
        
        guard let num = Int(myTextField.text!) else {
            let alert = UIAlertController(title: "Oops!", message: "Invalid input. Please enter a number", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel))
            DispatchQueue.main.async {
                self.present(alert, animated: true, completion: nil)
            }
            return
        }
        
        let vc = ResultVc()
        if num % 2 == 0 {
            vc.result = "Even Number"
        } else {
            vc.result = "Odd Number"
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(myTextField)
        view.addSubview(myButton)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        myTextField.frame = CGRect(x: 40, y: (view.height/2) - 50, width: view.width - 80, height: 60)
        myButton.frame = CGRect(x: 40, y: myTextField.bottom+20, width:  view.width - 80, height: 60)
        }
}
