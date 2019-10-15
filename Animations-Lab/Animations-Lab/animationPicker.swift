//
//  animationPicker.swift
//  Animations-Lab
//
//  Created by Phoenix McKnight on 10/14/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import Foundation
import UIKit

class animationPicker:UIViewController {
   
    var arrayOfOptions = ["Repeat","AutoReverse","AllowAnimatedContent","Curve Ease Out","Curve Ease In"]
           

    var animationPicker:UIPickerView = {
        let picker = UIPickerView()
        
        return picker
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(animationPicker)
        animationPicker.delegate = self
        animationPicker.dataSource = self
        animationPicker.backgroundColor = .white
    }
}
extension animationPicker:UIPickerViewDelegate,UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arrayOfOptions.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
      return  arrayOfOptions[row]
    }
        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            
            UserDefaultsWrapper.shared.store(option: arrayOfOptions[row])
            
            let alert = UIAlertController(title: "Option Picked", message: "You have picked \(arrayOfOptions[row])", preferredStyle: .alert)
            let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            let proceed = UIAlertAction(title: "Ok", style: .default) { (actions) in
                self.dismiss(animated: true, completion: nil)
            }
                alert.addAction(cancel)
                alert.addAction(proceed)
            present(alert,animated: true)
            }
            
    }
    
    
    


