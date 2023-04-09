//
//  todoAppApp.swift
//  todoApp
//
//  Created by 박진은 on 2023/04/09.
//

import SwiftUI

/*
 
 MVVM Architecture
 Model - data point
 View - Ui
 ViewModel - manages Models for View
 
 */


@main
struct todoAppApp: App {
    
    @StateObject var listViewModel : ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(listViewModel)
        }
    }
}
