//
//  ContentView.swift
//  kebhub
//
//  Created by Simone Tesini on 24/10/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query var kebabbaros: [Kebabbaro]
    var body: some View {
        NavigationStack {
            List {
                ForEach(kebabbaros) { k in
                    Text(k.name).font(.headline)
                }
                .onDelete(perform:deleteKebabbaros)
            }
        .navigationTitle("Kebhub")
        .toolbar {
            Button("Add sample") {
                modelContext.insert(Kebabbaro(name: "matteotti kebab", imageName: "logo", address: "piazza matteotti", positive: 100000, negative: 0))
                }
            }
        }
    }
    
    func deleteKebabbaros(_ indexSet: IndexSet) {
        for index in indexSet {
            let k = kebabbaros[index]
            modelContext.delete(k)
        }
    }
}

#Preview {
    ContentView().modelContainer(for: Kebabbaro.self)
}
