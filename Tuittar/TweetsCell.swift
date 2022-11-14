//
//  TweetsCell.swift
//  Tuittar
//
//  Created by TEN MATSUMOTO on 16/10/2022.
//

import UIKit

class TweetsCell: UITableViewCell {
    
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var tweetTime: UILabel!
    @IBOutlet weak var body: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
