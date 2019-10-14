//
//  userDefaultsWrapper.swift
//  Animations-Lab
//
//  Created by Phoenix McKnight on 10/14/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import Foundation
 
struct UserDefaultsWrapper {
    static let shared = UserDefaultsWrapper()
    private let currentOption = "currentOption"
    
    func store(option:String) {
        UserDefaults.standard.set(option, forKey: currentOption)
    }
    func getOption() -> String? {
        UserDefaults.standard.value(forKey: currentOption) as? String
    }
}

