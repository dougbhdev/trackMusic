//
//  UIViewController+extensions.swift
//  trackMusic
//
//  Created by Douglas  Goulart Nunes on 11/09/19.
//  Copyright © 2019 Douglas Nunes. All rights reserved.
//

import UIKit

extension UIViewController {
  
  func showError(_ message: String) {
    let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
    let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
    
    alert.addAction(ok)
    self.navigationController?.present(alert, animated: true, completion: nil)
  }
  
}
