//
//  CreateGoalVC.swift
//  GoalPost
//
//  Created by David E Bratton on 11/5/18.
//  Copyright © 2018 David Bratton. All rights reserved.
//

import UIKit

class CreateGoalVC: UIViewController, UITextViewDelegate {

    @IBOutlet weak var goalTextView: UITextView!
    @IBOutlet weak var shortTermBtn: UIButton!
    @IBOutlet weak var longTermBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    
    // Call Enums => GoalType
    var goalType: GoalType = .shorTerm
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Call Extensions => UIViewExt
        nextBtn.bindToKeyBoard()
        // Call Extensions => UIButtonExt
        shortTermBtn.setSelectedColor()
        longTermBtn.setDeselectedColor()
        goalTextView.delegate = self
    }
    
    @IBAction func nextBtnPressed(_ sender: Any) {
        if goalTextView.text != "" && goalTextView.text != "What is your goal?" {
            guard let finishGoalVC = storyboard?.instantiateViewController(withIdentifier: "FinishGoalVC") as? FinishGoalVC else { return }
            if let goalText = goalTextView.text {
                finishGoalVC.initData(description: goalText, type: goalType)
                //presentDetail(finishGoalVC)
                presentingViewController?.presentSecondaryDetail(finishGoalVC)
            }
        }
    }
    
    @IBAction func shortTermBtnPressed(_ sender: Any) {
        goalType = .shorTerm
        shortTermBtn.setSelectedColor()
        longTermBtn.setDeselectedColor()
    }
    
    @IBAction func longTermBtnPressed(_ sender: Any) {
        goalType = .longTerm
        longTermBtn.setSelectedColor()
        shortTermBtn.setDeselectedColor()
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        dismissDetail()
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        goalTextView.text = ""
        goalTextView.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
}
