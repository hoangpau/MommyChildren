//
//  ViewController.swift
//  MommyChildren
//
//  Created by Hoang on 4/1/17.
//  Copyright © 2017 Hoang. All rights reserved.
//

import UIKit

class IntroduceViewController: UIViewController {

    @IBOutlet weak var bottomConstraintOfButton: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        bottomConstraintOfButton.constant = 0.1 * self.view.frame.size.height
    }

}

