//
//  FinishGoalVC.swift
//  GoalPost
//
//  Created by David E Bratton on 11/5/18.
//  Copyright © 2018 David Bratton. All rights reserved.
//

import UIKit
import CoreData

class FinishGoalVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var createGoalBtn: UIButton!
    @IBOutlet weak var pointsTextField: UITextField!
    
    var goalDescription: String!
    var goalType: GoalType!
    
    func save(completion: (_ finished: Bool) -> ()) {
        guard let managedContext = AppDel.AD?.persistentContainer.viewContext else { return }
        let goal = Goal(context: managedContext)
        goal.goalDescription = goalDescription
        goal.goalType = goalType.rawValue
        if let points = pointsTextField.text {
            goal.goalCompletionValue = Int32(points)!
        }
        goal.goalProgress = Int32(0)
        
        do {
            try managedContext.save()
            print("Success Adding Data")
            completion(true)
        } catch {
            print("Error Saving Data: \(error.localizedDescription)")
            completion(false)
        }
    }
    
    func initData(description: String, type: GoalType) {
        self.goalDescription = description
        self.goalType = type
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createGoalBtn.bindToKeyBoard()
        pointsTextField.delegate = self
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        dismissDetail()
    }
    
    @IBAction func createGoalBtnPressed(_ sender: Any) {
        if pointsTextField.text != "" {
            self.save { (complete) in
                if complete {
                    dismiss(animated: true, completion: nil)
                }
            }
        }
    }
}
