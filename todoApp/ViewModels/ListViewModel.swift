//
//  ListViewModel.swift
//  todoApp
//
//  Created by 박진은 on 2023/04/09.
//

import Foundation
class ListViewModel: ObservableObject{//추적 관찰 가능하게 만들
    
    @Published var items: [ItemModel] = []{
        didSet{
            saveItems()//data 의 변경이 일어날 때 마다 호출되게 만듦
        }
    }
    let itemsKey: String = "items_list"
    
    init(){
        getItems()
    }
    
    func getItems(){
//        let newItems = [
//            ItemModel(title: "this si the first title", isCompleted: false),
//            ItemModel(title:"this is the second title",isCompleted: false),
//            ItemModel(title: "this is the third titl", isCompleted: false)
//            ]
//
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else {return}
        
        self.items = savedItems
    }
    
    func deleteItem(indexSet: IndexSet){
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int){
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String){
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    func updateItem(item: ItemModel){
        //        if let index = items.firstIndex { (existingItem)-> Bool in
        //            return existingItem.id == item.id
        //        }{
        //            //run this code
        //        }
        //    }
        
        if let index = items.firstIndex(where: { $0.id == item.id}){
            items[index] = item.updateCompletation()
        }
    }
    func saveItems(){
        if let encodedData = try? JSONEncoder().encode(items){
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
}
