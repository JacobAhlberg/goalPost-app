 //
//  GoalCell.swift
//  goalPost-app
//
//  Created by Jacob Ahlberg on 2017-11-02.
//  Copyright © 2017 Jacob Ahlberg. All rights reserved.
//

import UIKit

class GoalCell: UITableViewCell {

    @IBOutlet weak var goalDescriptionLbl: UILabel!
    @IBOutlet weak var goalTypeLbl: UILabel!
    @IBOutlet weak var progressLbl: UILabel!
    @IBOutlet weak var completionView: UIView!
    
    func configureCell(goal: Goal) {
        
        self.goalDescriptionLbl.text = goal.goalDescription
        self.goalTypeLbl.text = goal.goalType
        self.progressLbl.text = String(describing: goal.goalProgress)
        
        if goal.goalProgress == goal.goalCompletionValue {
            self.completionView.isHidden = false
        } else {
            self.completionView.isHidden = true
        }
    }

}
