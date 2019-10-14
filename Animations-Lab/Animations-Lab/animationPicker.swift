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
        return 5
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
        case 1:
            return "Repeat"
        case 2:
            return "AutoReverse"
        case 3:
            return "AllowAnimatedContent"
        case 4:
            return "Curve Ease Out"
            
        case 5:
            return "Curve Ease In"
        
        default:
        return " "
        }
       
        
    }
    
    
    

}
