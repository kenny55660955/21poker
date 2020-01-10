//
//  Alert.swift
//  21poker
//
//  Created by Kenny on 2020/1/10.
//  Copyright © 2020 CodewithKenny. All rights reserved.
//

import Foundation
import  UIKit

struct Alert {
    static func showBasicAlert(on vc: UIViewController, with title: String, message: String){
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        DispatchQueue.main.sync {
            vc.present(alert, animated: true)
        }
        
    }
//    static func winAlert(on vc: UIViewController){
//        showBasicAlert(on: vc, with: "Lose", message: "Busted")
//    }
    
}

