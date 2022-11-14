//
//  TuittarDataModel.swift
//  Tuittar
//
//  Created by TEN MATSUMOTO on 16/10/2022.
//

import Foundation
import RealmSwift

class TweetDataModel: Object {
    @objc dynamic var id: String = UUID().uuidString
    @objc dynamic var user: String = ""
    @objc dynamic var time: Date = Date()
    @objc dynamic var tweet: String = ""
}

