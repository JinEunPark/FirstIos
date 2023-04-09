//
//  ItemModel.swift
//  todoApp
//
//  Created by 박진은 on 2023/04/09.
//

import Foundation
struct ItemModel: Identifiable ,Codable {//codable -> class json
    
    let id: String
    let title: String
    let isCompleted: Bool
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func updateCompletation()->ItemModel{
        return ItemModel(id: id, title: title, isCompleted: !isCompleted)
    }
}
