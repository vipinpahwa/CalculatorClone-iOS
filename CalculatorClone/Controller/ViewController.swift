//
//  ViewController.swift
//  CalculatorClone
//
//  Created by Vipin Pahwa on 28/06/21.
//

import UIKit

class ViewController: UIViewController {
    var calculatorBackend = CalculatorBackend()
    
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
    
    override func viewWillAppear(_ animated: Bool) {
        self.view.backgroundColor = UIColor.black
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        calculatorBackend.delegate = self
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
            numberLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100),
            numberLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func setupButtons() {
        self.view.addSubview(buttonsStackView)
        
        NSLayoutConstraint.activate([
            buttonsStackView.topAnchor.constraint(equalTo: self.numberLabel.bottomAnchor, constant: 16),
            buttonsStackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            buttonsStackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
            buttonsStackView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -16)
        ])
        let zeroRow = createHorizontalStack(with: ["AC","??","%","??"])
        buttonsStackView.addArrangedSubview(zeroRow)
        
        let firstRow = createHorizontalStack(with: ["7","8","9","x"])
        buttonsStackView.addArrangedSubview(firstRow)
        
        let secondRow = createHorizontalStack(with: ["4","5","6","-"])
        buttonsStackView.addArrangedSubview(secondRow)
        
        let thirdRow = createHorizontalStack(with: ["1","2","3","+"])
        buttonsStackView.addArrangedSubview(thirdRow)
        
        let fourthRow = createHorizontalStack(with: ["0",".","="])
        buttonsStackView.addArrangedSubview(fourthRow)
    }
    
    private func createHorizontalStack(with buttonLabels: [String]) -> UIStackView {
        let horizontalStackView = UIStackView(frame: .zero)
        horizontalStackView.axis = .horizontal
        horizontalStackView.distribution = .fillEqually
        horizontalStackView.spacing = 8
        horizontalStackView.translatesAutoresizingMaskIntoConstraints = false
        for buttonLabel in buttonLabels {
            let button =  CalculatorButton(frame: .zero)
            button.label = buttonLabel
            button.addTarget(self, action: #selector(self.buttonTapped), for: .touchUpInside)
            horizontalStackView.addArrangedSubview(button)
        }
        
        return horizontalStackView
    }
    
    @objc func buttonTapped(sender: UIButton) {
        guard let numberPressed = sender.currentTitle else { return }
        self.calculatorBackend.buttonPressed(buttonLabel: numberPressed)
    }
}

extension ViewController: CalculatorBackendDelegate {
    func updateNumberLabel(label: String) {
        self.numberLabel.text = label
    }
}
