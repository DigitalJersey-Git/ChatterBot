//
//  GroupCellTableViewCell.swift
//  ChatterBot
//
//  Created by Chris Mousdale on 27/02/2017.
//  Copyright © 2017 Chris Mousdale. All rights reserved.
//

import UIKit
import SendBirdSDK

class groupCell: UITableViewCell {
    
    @IBOutlet weak var groupImage: UIImageView!
    @IBOutlet weak var groupName: UILabel!
    @IBOutlet weak var groupParticipantCnt: UILabel!
    
    
    private var channel: SBDOpenChannel!
    
    /*
     var group: Group! {
     didSet {
     groupName.text = group.name
     groupImage.image = imageForGroup()
     }
     }
     */
    
    func imageForGroup() -> UIImage? {
        return UIImage(named: "chatimg")
    }
    
    func setCellInfo(aChannel: SBDOpenChannel) {
        self.channel = aChannel
        
        self.groupName.text = self.channel.name
        self.groupParticipantCnt.text = String(self.channel.participantCount) + " Participant" + String((self.channel.participantCount <= 1) ? "" : "s")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }

}
