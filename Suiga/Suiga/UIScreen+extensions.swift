//
//  UIScreen+extensions.swift
//  Suiga
//
//  Created by Rachel Castor on 9/23/26.
//

import Foundation
import UIKit


extension UIScreen {
    static var current: UIScreen? {
        let scenes = UIApplication.shared.connectedScenes
        let windowScene = scenes.first { $0.activationState == .foregroundActive } as? UIWindowScene
        return windowScene?.screen
    }
}
