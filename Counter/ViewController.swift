//
//  ViewController.swift
//  Counter
//
//  Created by Yana Silosieva on 01.09.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resetCountButton: UIButton!
    
    @IBOutlet weak var increaseButton: UIButton!
    
    @IBOutlet weak var decreaseButton: UIButton!
    
    @IBOutlet weak var countLabel: UILabel!

    @IBOutlet weak var changeHistoryTextView: UITextView!
    
    private var count: Int = 0 {
        didSet {
            if count < 0 {
                count = 0
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        increaseButton.layer.cornerRadius = 15
        decreaseButton.layer.cornerRadius = 15
        changeHistoryTextView.layer.cornerRadius = 15
        changeHistoryTextView.isEditable = false
        changeHistoryTextView.isScrollEnabled = true
    }
    
    @IBAction func resetAction(_ sender: Any) {
        count = 0
        countLabel.text = "0"
        updateChangeHistory(with: "значение сброшено")
    }
    
    @IBAction func increaseAction(_ sender: Any) {
        count += 1
        countLabel.text = "Значение счётчика: \(count)"
        updateChangeHistory(with: "значение изменено на +1")
    }
    
    @IBAction func decreaseAction(_ sender: Any) {
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
    func getCurrentFormattedDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
        let currentDate = Date()
        return dateFormatter.string(from: currentDate)
    }
    
    func updateChangeHistory(with message: String) {
        let currentDateTime = getCurrentFormattedDate()
        changeHistoryTextView.text += "\(currentDateTime): \(message)\n"
    }
    
}

