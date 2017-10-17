//
//  FriendTableViewCell.swift
//  MoodTracker
//
//  Created by Andrew Tsukuda on 10/17/17.
//  Copyright © 2017 Andrew Tsukuda. All rights reserved.
//

import UIKit

class FriendTableViewCell: UITableViewCell {

    @IBOutlet weak var friendEmojiLabel: UILabel!
    @IBOutlet weak var friendNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
