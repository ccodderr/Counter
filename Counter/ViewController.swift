//
//  ViewController.swift
//  Counter
//
//  Created by Yana Silosieva on 01.09.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var resetCountButton: UIButton!
    
    @IBOutlet private weak var increaseButton: UIButton!
    
    @IBOutlet private weak var decreaseButton: UIButton!
    
    @IBOutlet private weak var countLabel: UILabel!

    @IBOutlet private weak var historyTextView: UITextView!
    
    private var count: Int = 0 {
        didSet {
            guard count > 0 else {
                count = 0
                return
            }
        }
    }
    
    private let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
        return dateFormatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
    }
    
    private func setupLayout() {
        increaseButton.layer.cornerRadius = 15
        decreaseButton.layer.cornerRadius = 15
        historyTextView.layer.cornerRadius = 15
        historyTextView.isEditable = false
        historyTextView.isScrollEnabled = true
    }
    
    @IBAction private func resetAction(_ sender: Any) {
        count = 0
        countLabel.text = "0"
        updateChangeHistory(with: "значение сброшено")
    }
    
    @IBAction private func increaseAction(_ sender: Any) {
        count += 1
        countLabel.text = "Значение счётчика: \(count)"
        updateChangeHistory(with: "значение изменено на +1")
    }
    
    @IBAction private func decreaseAction(_ sender: Any) {
        count -= 1
        guard count > .zero else {
            countLabel.text = "0"
            updateChangeHistory(with: "попытка уменьшить значение счётчика ниже 0")
            return
        }
        countLabel.text = "Значение счётчика: \(count)"
        updateChangeHistory(with: "значение изменено на -1")
    }
}

extension ViewController {
    private func getCurrentFormattedDate() -> String {
        let currentDate = Date()
        return dateFormatter.string(from: currentDate)
    }
    
    private func updateChangeHistory(with message: String) {
        let currentDateTime = getCurrentFormattedDate()
        historyTextView.text += "\(currentDateTime): \(message)\n"
    }
    
}

