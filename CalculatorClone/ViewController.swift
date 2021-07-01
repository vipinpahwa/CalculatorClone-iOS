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
    
    let buttonsStackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
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
        setupNumberLabel()
        setupButtons()
    }
    
    private func setupNumberLabel() {
        self.view.addSubview(numberLabel)
        
        NSLayoutConstraint.activate([
            numberLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            numberLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
            numberLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100)
        ])
    }
    
    private func setupButtons() {
        self.view.addSubview(buttonsStackView)
        
        NSLayoutConstraint.activate([
            buttonsStackView.topAnchor.constraint(equalTo: self.numberLabel.bottomAnchor, constant: 16),
            buttonsStackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            buttonsStackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16)
        ])
        let firstRow = createHorizontalStack(with: ["7","8","9"])
        buttonsStackView.addArrangedSubview(firstRow)
        
        let secondRow = createHorizontalStack(with: ["4","5","6"])
        buttonsStackView.addArrangedSubview(secondRow)
        
        let thirdRow = createHorizontalStack(with: ["1","2","3"])
        buttonsStackView.addArrangedSubview(thirdRow)
    }
    
    private func createHorizontalStack(with buttonLabels: [String]) -> UIStackView {
        let horizontalStackView = UIStackView(frame: .zero)
        horizontalStackView.axis = .horizontal
        horizontalStackView.distribution = .fillEqually
        horizontalStackView.spacing = 8
        horizontalStackView.translatesAutoresizingMaskIntoConstraints = false
        for buttonLabel in buttonLabels {
            let button = NumberButton(frame: .zero)
            button.addTarget(self, action: #selector(self.numberButtonTapped), for: .touchUpInside)
            if let number = Int(buttonLabel) {
                button.number = number
            }
            horizontalStackView.addArrangedSubview(button)
        }
        
        return horizontalStackView
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
