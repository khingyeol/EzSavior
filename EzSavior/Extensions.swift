//
//  Extensions.swift
//  EzSavior
//
//  Created by Hatto on 27/10/2563 BE.
//

import UIKit

extension UIViewController {
    func hideKB(){
        let tap: UITapGestureRecognizer=UITapGestureRecognizer(target: self, action: #selector(dissmissmykb))
        view.addGestureRecognizer(tap)
    }
    @objc func dissmissmykb(){
        view.endEditing(true)
    }
}
