//
//  Category.swift
//  Todoey
//
//  Created by Tunc on 5.02.2018.
//  Copyright © 2018 Tunc. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name: String = ""
    let items = List<Item>()
}
