//
//  ViewController.swift
//  Responder-Example
//
//  Created by cleanmac on 24/04/23.
//

import UIKit

class ViewController: UIViewController {
    
    private var fieldInputView: ResponderView!
    private lazy var inputToolbar: UIToolbar = {
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        toolbar.barStyle = .default
        return toolbar
    }()
    private lazy var inputField: UITextField = {
        let inputField = UITextField(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        inputField.isUserInteractionEnabled = false
        return inputField
    }()
    
    override func loadView() {
        super.loadView()
        fieldInputView = ResponderView()
        fieldInputView.backgroundColor = .blue
        fieldInputView.translatesAutoresizingMaskIntoConstraints = false
        fieldInputView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(fieldInputAction)))
        
//        inputToolbar.items = [
//            UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: nil)
//        ]
//        inputToolbar.sizeToFit()
//        fieldInputView.inputAccessoryView = inputToolbar
        view.addSubview(fieldInputView)
        
        NSLayoutConstraint.activate([
            fieldInputView.heightAnchor.constraint(equalToConstant: 50),
            fieldInputView.widthAnchor.constraint(equalToConstant: 50),
            fieldInputView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0),
            fieldInputView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0)
        ])
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @objc private func fieldInputAction() {
        if fieldInputView.isFirstResponder {
            fieldInputView.resignFirstResponder()
        } else {
            fieldInputView.becomeFirstResponder()
        }
    }

}

