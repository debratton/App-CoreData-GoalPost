//
//  GoalCell.swift
//  GoalPost
//
//  Created by David E Bratton on 11/4/18.
//  Copyright © 2018 David Bratton. All rights reserved.
//

import UIKit

class GoalCell: UITableViewCell {

    @IBOutlet weak var goalDescriptionLbl: UILabel!
    @IBOutlet weak var goalTypeLbl: UILabel!
    @IBOutlet weak var goalProgressLbl: UILabel!
    
    func configureCell(goalDescription: String, goalType: GoalType, goalProgress:Int) {
        self.goalDescriptionLbl.text = goalDescription
        self.goalTypeLbl.text = goalType.rawValue
        self.goalProgressLbl.text = String(describing: goalProgress)
    }
}
