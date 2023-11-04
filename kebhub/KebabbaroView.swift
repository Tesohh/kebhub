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
//    @State var addresswidth
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
                        if kebabbaro.wheelChairAccessible {
                            Image(systemName: "figure.roll")
                        }
                        if kebabbaro.petFriendly {
                            Image(systemName: "dog")
                        }
                        Text(kebabbaro.address).font(.subheadline).truncationMode(.tail)
                        Spacer()
                    }.frame(width: 150, height: 10)
                }
                
                Spacer()
                
                Text("\(kebabbaro.points)").foregroundStyle(kebabbaro.points > 0 ? .green : .red).frame(width: 30)
                
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
        let k2 = Kebabbaro(name: "Matteotti Icelandic", imageName: "matteottikebab", address: "Piazza matteotti", points: 0)
        
        return NavigationStack {
            List {
                KebabbaroView(kebabbaro: k).modelContainer(container)
                KebabbaroView(kebabbaro: k).modelContainer(container)
                KebabbaroView(kebabbaro: k2).modelContainer(container)
            }
        }
    } catch {
        fatalError()
    }
}
