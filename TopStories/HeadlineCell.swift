//
//  HeadlineCell.swift
//  TopStories
//
//  Created by Chakane Shegog on 9/10/21.
//  Copyright © 2021 Alex Paul. All rights reserved.
//

import UIKit

class HeadlineCell: UITableViewCell {

    @IBOutlet weak var headlineImageView: UIImageView!
    @IBOutlet weak var headlineTitleLabel: UILabel!
    @IBOutlet weak var bylineLabel: UILabel!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        // change the corner radius here
        headlineImageView.layer.cornerRadius = 4
    }
    
    func configureCell(for headline: NewsHeadline) {
        headlineTitleLabel.text = headline.title
        bylineLabel.text = headline.byline
    }

}
