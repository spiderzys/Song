//
//  UIViewController.swift
//  Song
//
//  Created by Yangsheng Zou on 2021-01-31.
//  Copyright © 2021 Yangsheng. All rights reserved.
//

import UIKit

extension UIViewController {
    func showAlert(message:String?, interval: TimeInterval) {
        let alertController = UIAlertController(title: "alert", message: message, preferredStyle: .alert)
        self.show(alertController, sender: nil)
        Timer.scheduledTimer(withTimeInterval: interval, repeats: false) { (_) in
            alertController.dismiss(animated: true, completion: nil)
        }
    }
}


