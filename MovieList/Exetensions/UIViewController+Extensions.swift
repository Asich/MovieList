//
//  UIViewController+Extensions.swift
//  MovieList
//
//  Created by Askar Mustafin on 3/31/20.
//  Copyright © 2020 Ainur. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func showDefaultAlert(title: String?, message: String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
}
