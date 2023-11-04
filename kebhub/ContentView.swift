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
    @Query(sort: \Kebabbaro.points, order: .reverse) var kebabbaros: [Kebabbaro]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(kebabbaros) { k in
                    KebabbaroView(kebabbaro: k)
                }
                .onDelete(perform:deleteKebabbaros)
            }
            .navigationTitle("Kebhub")
            .toolbar {
                Button("Nuovo") {
                    modelContext.insert(Kebabbaro(name: "Nuovo kebabbaro", imageName: "generickebab", address: "Indirizzo...", points: 0))
                }
            }
        }
        .onAppear(perform: {
            guard kebabbaros.isEmpty else { return }
            for k in Kebabbaro.sampleData {
                modelContext.insert(k)
            }
        })
    }
    
    func noop () {}
    
    func deleteKebabbaros(_ indexSet: IndexSet) {
        for index in indexSet {
            let k = kebabbaros[index]
            modelContext.delete(k)
        }
    }
    
    func navToKebbabaroEdit() -> some View {
        let k = Kebabbaro(name: "Matteotti Turkish", imageName: "matteottikebab", address: "Piazza Matteotti, Bolzano BZ", points: 0)
        modelContext.insert(k)
        return EditKebabbaroView(kebabbaro: k)
    }
}

#Preview {
    ContentView().modelContainer(for: Kebabbaro.self)
}
