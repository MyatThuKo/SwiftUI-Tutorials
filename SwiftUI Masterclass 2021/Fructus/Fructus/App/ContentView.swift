//
//  ContentView.swift
//  Fructus
//
//  Created by Myat Thu Ko on 3/2/21.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    
    var fruits: [Fruit] = fruitData
    @State private var isShowingSetting: Bool = false
    
    // MARK: - BODY
    
    var body: some View {
        NavigationView {
            List {
                ForEach(fruits.shuffled()) { fruit in
                    NavigationLink(destination: FruitDetailView(fruit: fruit)) {
                        FruitRowView(fruit: fruit)
                            .padding(.vertical, 4)
                    }
                }
            }
            .navigationTitle("Fruits")
            .navigationBarItems(trailing:
                                    Button(action: {
                                        isShowingSetting.toggle()
                                    }, label: {
                                        Image(systemName: "slider.horizontal.3")
                                    }) //: Button
                                    .sheet(isPresented: $isShowingSetting) {
                                        SettingView()
                                    }
            )
        } //: NavigationView
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

// MARK: - PREVIEW

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
