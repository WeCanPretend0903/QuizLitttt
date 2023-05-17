//
//  MessageCell.swift
//  QuizLitttt
//
//  Created by Peijian Huang on 5/17/23.
//

import UIKit

class MessageCell: UITableViewCell {

    @IBOutlet weak var ContentContainer: UIView!
    @IBOutlet weak var Content: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        ContentContainer.layer.cornerRadius = ContentContainer.frame.size.height/5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
