//
//  MenuItem.swift
//  Menu
//
//  Created by Charles Nebo on 4.6.2024.
//

import Foundation
struct MenuItem: Identifiable{
    
    var id: UUID = UUID()
    var name: String
    var price: String
    var imageName: String
}
