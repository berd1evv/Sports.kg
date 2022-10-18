//
//  Extension + UIView.swift
//  Sports.kg
//
//  Created by Eldiiar on 9/10/22.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach { addSubview($0) }
    }
}
