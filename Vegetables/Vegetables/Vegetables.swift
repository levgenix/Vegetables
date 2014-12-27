//
//  Vegetables.swift
//  Vegetables
//
//  Created by Evgeny Lobach on 27.12.14.
//  Copyright (c) 2014 The Ministry. All rights reserved.
//

import UIKit

class Vegetables: NSObject {
    
    var prices:[String:Double] = [
        "Томаты": 89.5,
        "Огурцы": 103.58,
        "Кабачок": 49.05,
        "Тыква": 77.05,
        "Картофель": 80.0,
        "Морковь": 100.45,
        "Свекла": 120.8,
        "Репа": 76.25
    ]
    
    var namesList:[String] {
        get{
            return Array(prices.keys)
        }
    }
}
