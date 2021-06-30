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
    
    var acButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.backgroundColor = .lightGray
        button.setTitle("AC", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    var firstRow: UIStackView = {
        let row = UIStackView(frame: .zero)
        row.translatesAutoresizingMaskIntoConstraints = false
        row.axis = .horizontal
        row.distribution = .fillEqually
        row.spacing = 8
        
        return row
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
        addACButton()
        addFirstRow()
    }
    
    private func addNumberLabel() {
        self.view.addSubview(numberLabel)
        
        NSLayoutConstraint.activate([
            numberLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            numberLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
            numberLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100)
        ])
    }
    
    private func addACButton() {
        self.view.addSubview(acButton)
        acButton.layer.cornerRadius = 25
        acButton.addTarget(self, action: #selector(self.acButtonTapped), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            acButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            acButton.topAnchor.constraint(equalTo: self.numberLabel.bottomAnchor, constant: 20),
            acButton.heightAnchor.constraint(equalToConstant: 50),
            acButton.widthAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func addFirstRow() {
        self.view.addSubview(firstRow)
        NSLayoutConstraint.activate([
            firstRow.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            firstRow.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
            firstRow.topAnchor.constraint(equalTo: self.acButton.bottomAnchor, constant: 16),
            firstRow.heightAnchor.constraint(equalToConstant: 50)
        ])
        let numberSeven = NumberButton(frame: .zero)
        numberSeven.number = 7
        numberSeven.addTarget(self, action: #selector(self.numberButtonTapped), for: .touchUpInside)
        self.view.addSubview(numberSeven)
        firstRow.addArrangedSubview(numberSeven)
        
        let numberEight = NumberButton(frame: .zero)
        numberEight.number = 8
        numberEight.addTarget(self, action: #selector(self.numberButtonTapped), for: .touchUpInside)
        self.view.addSubview(numberEight)
        firstRow.addArrangedSubview(numberEight)
        
        let numberNine = NumberButton(frame: .zero)
        numberNine.number = 9
        numberNine.addTarget(self, action: #selector(self.numberButtonTapped), for: .touchUpInside)
        self.view.addSubview(numberNine)
        firstRow.addArrangedSubview(numberNine)
    }
    
    @objc func acButtonTapped(sender: UIButton) {
        numberLabel.text = "0"
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
