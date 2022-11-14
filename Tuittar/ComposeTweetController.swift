//
//  ComposeTweetController.swift
//  Tuittar
//
//  Created by TEN MATSUMOTO on 23/10/2022.
//

import Foundation
import UIKit
import RealmSwift

class ComposeTweetController: UIViewController {
    
    @IBAction func cancelButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func tweetButton(_ sender: UIButton) {
        buttonAction()
    }
    
    @IBOutlet weak var userNameTextField: UITextField!
    
    @IBOutlet weak var bodyTextField: UITextView!
    
    // Display contents
    override func viewDidLoad() {
        super.viewDidLoad()
        self.isModalInPresentation = true
        tweetFieldData()
    }
    
    func buttonAction() {
        if userNameTextField.text == "" || bodyTextField.text == "" {
            let alert = UIAlertController(title: "Fill in the blanks.", message: "", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alert, animated: true, completion: nil)
        } else if validate(text: bodyTextField.text) {
            let tweetData = TweetDataModel()
            let realm = try! Realm()
            try! realm.write {
                tweetData.user = userNameTextField.text ?? "Unknown"
                tweetData.time = Date()
                tweetData.tweet = bodyTextField.text
                realm.add(tweetData)
                self.dismiss(animated: true, completion: nil)
            }
        } else {
            let alert = UIAlertController(title: "Characters must 140 or less.", message: "\(bodyTextField.text.count) now.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func validate(text: String) -> Bool {
        // textが140より多い場合false, 以下だったらtrue
//        if text.count > 140 {
//            return false
//        } else {
//            return true
//        }
        return text.count <= 140
    }
    
    // Configure TextView
    func tweetFieldData() {
        bodyTextField.layer.borderWidth = 0.8
        bodyTextField.layer.borderColor = UIColor.systemCyan.cgColor
        bodyTextField.layer.masksToBounds = true
        bodyTextField.layer.cornerRadius = 12
    }
}

// Configure work of dismiss
extension ComposeTweetController {
    override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
        super.dismiss(animated: flag, completion: completion)
        guard let presentationController = presentationController else {
            return
        }
        presentationController.delegate?.presentationControllerDidDismiss?(presentationController)
    }
}
