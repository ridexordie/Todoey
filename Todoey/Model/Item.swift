//
//  Item.swift
//  Todoey
//
//  Created by Tunc on 23.01.2018.
//  Copyright © 2018 Tunc. All rights reserved.
//

import Foundation

class Item: Encodable, Decodable {
    
    var title: String = ""
    var done: Bool = false
    
}
