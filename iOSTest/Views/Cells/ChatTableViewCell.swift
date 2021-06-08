//
//  ChatTableViewCell.swift
//  iOSTest
//
//  Copyright © 2020 Rapptr Labs. All rights reserved.

import UIKit

class ChatTableViewCell: UITableViewCell {
    
    /**
     * =========================================================================================
     * INSTRUCTIONS
     * =========================================================================================
     * 1) Setup cell to match mockup
     *
     * 2) Include user's avatar image
     **/
    
    // MARK: - Outlets
    @IBOutlet weak var header: UILabel!
    @IBOutlet weak var body: UITextView!

    private var avatar: UIImageView?

    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()

        if avatar == nil {
            avatar = UIImageView(frame: CGRect(x: 16, y: 16, width: 30, height: 30))
            avatar!.contentMode = .scaleAspectFill
            avatar!.layer.cornerRadius = 15
            avatar!.layer.masksToBounds = false
            avatar!.clipsToBounds = true
            avatar!.image = UIImage(named: "AppIcon")!

            addSubview(avatar!)
        }
        body.layer.cornerRadius = 8
        body.layer.borderColor = UIColor.gray.cgColor
        body.layer.borderWidth = 1
        body.layer.masksToBounds = false
        body.clipsToBounds = true
        body.textContainerInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }

    // MARK: - Public
    func setCellData(message: Message) {
        header.text = message.username
        body.text = message.text
        avatar?.loadImage(url: message.avatarURL)
    }


}
