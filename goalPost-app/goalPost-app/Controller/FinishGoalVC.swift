//
//  FinishGoalVC.swift
//  goalPost-app
//
//  Created by Jacob Ahlberg on 2017-11-02.
//  Copyright © 2017 Jacob Ahlberg. All rights reserved.
//

import UIKit
import CoreData

class FinishGoalVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var createGoalBtn: UIButton!
    @IBOutlet weak var pointsTextField: UITextField!
    
    var goalDescription: String!
    var goalType: GoalType!
    
    
    func initData(description: String, type: GoalType) {
        self.goalDescription = description
        self.goalType = type
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createGoalBtn.bindToKeyboard()
        pointsTextField.delegate = self
    }

    @IBAction func createGoalBtnWasPressed(_ sender: Any) {
        if pointsTextField.text != "" {
            self.save { (complete) in
                if complete {
                    dismiss(animated: true, completion: nil)
                } else {
                    
                }
            }
        }
    }
    
    @IBAction func backBtnWasPressed(_ sender: Any) {
        dismissDetail()
    }
    
    func save(completion: (_ finished: Bool) -> ()) {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        let goal = Goal(context: managedContext)
        
        goal.goalDescription = goalDescription
        goal.goalType = goalType.rawValue
        goal.goalCompletionValue =  Int32(pointsTextField.text!)!
        goal.goalProgress = Int32(0)
        
        do {
            try managedContext.save()
            print("YEAH")
            completion(true)
        } catch {
            debugPrint("Could not save \(error.localizedDescription)")
            completion(false)
        }
        
        
    }
    
}






