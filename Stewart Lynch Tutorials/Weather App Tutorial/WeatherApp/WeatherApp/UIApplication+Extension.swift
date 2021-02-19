//
//  UIApplication+Extension.swift
//  WeatherApp
//
//  Created by Myat Thu Ko on 2/18/21.
//

import UIKit

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

