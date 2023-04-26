//
//  ResponderView.swift
//  Responder-Example
//
//  Created by cleanmac on 24/04/23.
//

import UIKit

protocol ResponderViewDelegate: AnyObject {
    func didReturn(_ text: String)
}

class ResponderView: UIView, UIKeyInput {
    weak var delegate: ResponderViewDelegate?
    override var canBecomeFirstResponder: Bool { true }
    override var canResignFirstResponder: Bool { true }
    var hasText: Bool { false }
    
    private lazy var inputToolbar: UIToolbar = {
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        toolbar.barStyle = .default
        return toolbar
    }()
    private lazy var inputField: UITextField = {
        let inputField = UITextField(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - 90, height: 50))
        inputField.placeholder = "Your value"
        inputField.isUserInteractionEnabled = false
        return inputField
    }()
    
    private var inputText: String = "" {
        didSet {
            inputField.text = inputText
        }
    }
    
    override var inputAccessoryView: UIView? {
        get {
            inputToolbar.items = [
                UIBarButtonItem(customView: inputField),
                UIBarButtonItem(title: "Done", style: .done, target: self, action: nil),
            ]
            inputToolbar.sizeToFit()
            return inputToolbar
        }
    }
    
    init() {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func insertText(_ text: String) {
        if text == "\n" { // The user presses the return key
            resignFirstResponder()
        } else {
            inputText += text
        }
    }
    
    func deleteBackward() {
        guard !inputText.isEmpty else { return }
        inputText.removeLast()
    }
}
