//
//  ViewController.swift
//  CalculatorClone
//
//  Created by Vipin Pahwa on 28/06/21.
//

import UIKit

class ViewController: UIViewController {
    var numberLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 1
        label.text = "0"
        label.textColor = .white
        label.textAlignment = .right
        label.font = UIFont(name: "Helvetica", size: 50)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    var button: UIButton = {
        let button = UIButton(frame: .zero)
        button.backgroundColor = .lightGray
        button.setTitle("AC", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        self.view.backgroundColor = UIColor.black
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSubviews()
    }
    
    private func setupSubviews() {
        addNumberLabel()
        addButton()
        addNumberButton()
    }
    
    private func addNumberLabel() {
        self.view.addSubview(numberLabel)
        
        NSLayoutConstraint.activate([
            numberLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            numberLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
            numberLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100)
        ])
    }
    
    private func addButton() {
        self.view.addSubview(button)
        button.layer.cornerRadius = 25
        
        NSLayoutConstraint.activate([
            button.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            button.topAnchor.constraint(equalTo: self.numberLabel.bottomAnchor, constant: 20),
            button.heightAnchor.constraint(equalToConstant: 50),
            button.widthAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func addNumberButton() {
        let numberOne = NumberButton(frame: .zero)
        numberOne.number = 1
        self.view.addSubview(numberOne)
        numberOne.addTarget(self, action: #selector(self.numberButtonTapped), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            numberOne.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            numberOne.topAnchor.constraint(equalTo: self.button.bottomAnchor, constant: 16),
            numberOne.heightAnchor.constraint(equalToConstant: 50),
            numberOne.widthAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc func numberButtonTapped(sender: UIButton) {
        guard let currentNumberLabel = numberLabel.text,
              let numberPressed = sender.currentTitle,
              currentNumberLabel.count <= 8 else {
            return
        }
        if currentNumberLabel == "0" {
            numberLabel.text = numberPressed
        } else {
            numberLabel.text = "\(currentNumberLabel)\(numberPressed)"
        }
    }
}
