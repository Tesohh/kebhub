//
//  KebabbaroView.swift
//  kebhub
//
//  Created by Simone Tesini on 28/10/23.
//

import SwiftUI
import SwiftData

struct KebabbaroView: View {
    @Bindable var kebabbaro: Kebabbaro
    var body: some View {
        NavigationLink(value: kebabbaro) {
            HStack {
                Image(kebabbaro.imageName).resizable().frame(width: 50, height: 50, alignment: .center).clipShape(.rect(cornerRadius: 5))
                
                VStack {
                    HStack {
                        Text(kebabbaro.name).font(.headline).frame(width:150, height: 15, alignment: .leading)
                        Spacer()
                    }
                    HStack {
                        Text(kebabbaro.address).font(.subheadline).truncationMode(.tail).frame(width: 150, height:10, alignment: .leading)
                        Spacer()
                    }
                }
                
                Spacer()
                
                Text("\(kebabbaro.points)").foregroundStyle(kebabbaro.points > 0 ? .green : .red)
                
                Button() {
                    kebabbaro.points += 1
                } label: { Image(systemName: "hand.thumbsup") }.buttonStyle(.borderless)
                
                Button() {
                    kebabbaro.points -= 1
                } label: { Image(systemName: "hand.thumbsdown") }.buttonStyle(.borderless)
            }
        }
        .navigationDestination(for: Kebabbaro.self, destination: EditKebabbaroView.init)
    }
}

#Preview {
    do  {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Kebabbaro.self, configurations: config)
        
        let k = Kebabbaro(name: "Matteotti Turkish", imageName: "matteottikebab", address: "Piazza matteotti", points: 100)
        
        return NavigationStack {
            List {
                KebabbaroView(kebabbaro: k).modelContainer(container)
                KebabbaroView(kebabbaro: k).modelContainer(container)
                KebabbaroView(kebabbaro: k).modelContainer(container)
            }
        }
    } catch {
        fatalError()
    }
}
