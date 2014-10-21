//
//  MsgListTableViewCell.swift
//  TinyMessage
//
//  Created by JOE on 14/10/21.
//  Copyright (c) 2014年 JOE. All rights reserved.
//

import UIKit

class MsgListTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var conentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func bindData(data:MessageEntity)
    {
        titleLabel.text = data.title
        conentLabel.text = data.content
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
