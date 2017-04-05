//
//  StatusViewController.swift
//  MommyChildren
//
//  Created by Hoang on 4/1/17.
//  Copyright © 2017 Hoang. All rights reserved.
//

import UIKit

class StatusViewController: UIViewController, UIPopoverPresentationControllerDelegate {
    @IBOutlet weak var constraintBottomOfButton: NSLayoutConstraint!
    
    @IBOutlet weak var pregnantMommyButton: UIButton!
    @IBOutlet weak var newMommyButton: UIButton!
    @IBOutlet weak var raisingChildrenMommyButton: UIButton!
    
    var isselecMommyButton = false
    
    var statusOfPregnantMommy: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        constraintBottomOfButton.constant = 0.1 * self.view.frame.size.height
        
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "popup" {
            guard let popupInfoOfMommyPregnatVC = segue.destination as? PopupInfoOfMommyPregnatViewController else {
                return
            }
            popupInfoOfMommyPregnatVC.delegate = self
            popupInfoOfMommyPregnatVC.popoverPresentationController?.delegate = self
            popupInfoOfMommyPregnatVC.preferredContentSize = CGSize(width: 200, height: 300)
            popupInfoOfMommyPregnatVC.popoverPresentationController?.sourceView = self.view
            popupInfoOfMommyPregnatVC.popoverPresentationController?.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
        }
        else if segue.identifier == "showHomeOfMommyPregnat" {
            if isselecMommyButton == false {
                print("Chua click button a")
                return
            }
            
        }
    }
    
    func popoverPresentationControllerDidDismissPopover(_ popoverPresentationController: UIPopoverPresentationController) {
        
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
    
    func restartStatusButton() {
        pregnantMommyButton.setImage(UIImage(named: "NonTick"), for: .normal)
        newMommyButton.setImage(UIImage(named: "NonTick"), for: .normal)
        raisingChildrenMommyButton.setImage(UIImage(named: "NonTick"), for: .normal)
    }
    
    @IBAction func selectedStatusMommy(_ sender: UIButton) {
        isselecMommyButton = true
        restartStatusButton()
        if sender === pregnantMommyButton {
            pregnantMommyButton.setImage(UIImage(named: "Ticked"), for: .normal)
        } else if sender === newMommyButton {
            newMommyButton.setImage(UIImage(named: "Ticked"), for: .normal)
        } else if sender === raisingChildrenMommyButton {
            raisingChildrenMommyButton.setImage(UIImage(named: "Ticked"), for: .normal)
        }
    }
    
    @IBAction func continueToHomTabelVc(_ sender: UIButton) {
        if isselecMommyButton == false {
            let alert = UIAlertController(title: "Thông báo", message: "Bạn chưa nhập gì", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
        } else if isselecMommyButton == true {
            let storyboad = UIStoryboard(name: "Main", bundle: nil)
            let customNavigationController = storyboad.instantiateViewController(withIdentifier: "CustomNavigationController") as! CustomNavigationController
            present(customNavigationController, animated: true, completion: nil)
        }
    }
}
extension StatusViewController: PopupInfoOfMommyPregnatViewControllerDelegate {
    func complete(name: String) {
        statusOfPregnantMommy = name
        dismiss(animated: true, completion: nil)
    }
}

