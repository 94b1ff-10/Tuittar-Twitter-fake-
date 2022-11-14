//
//  HomeViewController.swift
//  Tuittar
//
//  Created by TEN MATSUMOTO on 15/10/2022.
//

import Foundation
import UIKit
import RealmSwift

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    // EasterEgg ↓
    var tapCount: Int = 0
    @IBAction func quack(_ sender: UIButton) {
        self.tapCount += 1
        if tapCount == 3 {
            let alert = UIAlertController(title: "Quack! Quack!", message: "Hello, I'm TuittarBird.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Nice to meet you.", style: .default))
            self.present(alert, animated: true, completion: nil)
            tapCount = 0
        }
    }
    // Enjoy ↑
    
    // Transition to ComposeTweetController
    @IBAction func addBtn(_ sender: UIButton) {
        let nextView = storyboard?.instantiateViewController(identifier: "Next") as! ComposeTweetController
        nextView.presentationController?.delegate = self
        present(nextView, animated: true, completion: nil)
    }
    
    var tweetDataList: [TweetDataModel] = []
    
    // Changes date format
    var dateFormat: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .medium
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter
    }
    
    // Display contents
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.register(UINib(nibName: "TweetsCell", bundle: nil), forCellReuseIdentifier: "TweetsCell") // brought "TweetsCell".
        setTweetData()
    }
    
    func setTweetData() {
        let realm = try! Realm()
        let textData = realm.objects(TweetDataModel.self)
        tweetDataList = Array(textData)
    }
}

extension HomeViewController: UITableViewDataSource {
    //amount of cells
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tweetDataList.count
    }
    
    //contents of cells
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TweetsCell", for: indexPath) as! TweetsCell
        let tweetDataModel: TweetDataModel = tweetDataList[indexPath.row]
        cell.userName.text = tweetDataModel.user
        cell.tweetTime.text = "\(dateFormat.string(from: tweetDataModel.time))"
        cell.body.text = tweetDataModel.tweet
        return cell
    }
}

// Function when returning from ComposeTweetController
extension HomeViewController: UIAdaptivePresentationControllerDelegate {
    func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
        setTweetData()
        tableView.reloadData()
    }
}

