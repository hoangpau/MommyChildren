//
//  PopupInfoOfMommyPregnatViewController.swift
//  MommyChildren
//
//  Created by Hoang on 4/1/17.
//  Copyright © 2017 Hoang. All rights reserved.
//

import UIKit

protocol PopupInfoOfMommyPregnatViewControllerDelegate: class {
    func complete(name: String)
}

class PopupInfoOfMommyPregnatViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var pickerView: UIPickerView!
    weak var delegate: PopupInfoOfMommyPregnatViewControllerDelegate?
    
    var weeks: [Int] = []
    var selectedIndex: Int?

    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.delegate = self
        pickerView.dataSource = self
        
        setupData()

        // Do any additional setup after loading the view.
    }
    
    func setupData() {
        for i in 1...36 {
            weeks.append(i)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return weeks.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(weeks[row])
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedIndex = row
    }
    
    @IBAction func done(_ sender: UIButton) {
        guard let selectedIndexUnwrap = selectedIndex else {
            return
        }
        delegate?.complete(name: String(weeks[selectedIndexUnwrap]))
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
