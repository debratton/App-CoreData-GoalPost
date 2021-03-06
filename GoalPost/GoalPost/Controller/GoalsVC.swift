//
//  GoalsVC.swift
//  GoalPost
//
//  Created by David E Bratton on 11/4/18.
//  Copyright © 2018 David Bratton. All rights reserved.
//

import UIKit
import CoreData

class GoalsVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isHidden = false
    }

    @IBAction func addGoalBtnPressed(_ sender: Any) {
        print("Goal Button was pressed")
    }
    
}

extension GoalsVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "goalCell") as? GoalCell
            else { return UITableViewCell() }
        cell.configureCell(goalDescription: "Eat pizza 4 times per week", goalType: .longTerm, goalProgress: 3)
        return cell
    }
}
