//
//  EditDestinationView.swift
//  kebhub
//
//  Created by Simone Tesini on 28/10/23.
//

import SwiftUI
import SwiftData
import PhotosUI
import MapKit

struct EditKebabbaroView: View {
    @Bindable var kebabbaro: Kebabbaro
    @State private var coords: CLLocationCoordinate2D?
    @State private var photo: PhotosPickerItem?
    @State var data: Data?
    
    var body: some View {
        Form {
            TextField("Nome", text: $kebabbaro.name)
            TextField("Indirizzo", text: $kebabbaro.address).onSubmit() {
                    // update Map marker
            }
//            VStack {
//                if let data = data, let uiimage = UIImage(data:data) {
//                    Image(uiImage: uiimage).resizable().frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height:100).scaledToFit()
//                }
//                PhotosPicker(selection: $photo, matching: .images) {
//                    Text("pick photo")
//                }
//                .onChange(of: photo) { newValue in
//                    guard let item = photo else {
//                        return
//                    }
//                    item.loadTransferable(type: Data.self) { result in
//                        switch result {
//                        case .success(let data):
//                            if let data = data {
//                                self.data = data
//                                kebabbaro.data = data
//                            } else {
//                                print("failed ti loaad")
//                            }
//                        case .failure(let failure):
//                            fatalError("\(failure)")
//                        }
//                    }}
//                .onAppear() {
//                    if let data = kebabbaro.data {
//                        self.data = data
//                    }
//                }
//            }
            // TODO
//            Map {
//                Marker("Asd", coordinate: coords ?? CLLocationCoordinate2D(latitude: 0, longitude: 0))
//            }.mapControlVisibility(.visible).frame(width: 340, height: 500)
            Toggle("Adatto per sedia a rotelle", systemImage: "figure.roll", isOn: $kebabbaro.wheelChairAccessible)
            Toggle("Animali benvenuti", systemImage: "dog", isOn: $kebabbaro.petFriendly)
            HStack {
                Text("Punti: " + kebabbaro.points.description)
                Spacer()
                Button() {
                    kebabbaro.points += 1
                } label: { Image(systemName: "hand.thumbsup") }.buttonStyle(.borderless)
                
                Button() {
                    kebabbaro.points -= 1
                } label: { Image(systemName: "hand.thumbsdown") }.buttonStyle(.borderless)
            }
            
        }
        .navigationTitle("Modifica kebabbaro")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    init(kebabbaro: Kebabbaro) {
        self.kebabbaro = kebabbaro
//        self.getCoords()
    }
    
    func getCoords() {
        let geocoder = CLGeocoder()
        var coordinates = CLLocationCoordinate2D(latitude: 0, longitude: 0)
        geocoder.geocodeAddressString(kebabbaro.address, completionHandler: {(placemarks, error) -> Void in
            if((error) != nil){
                print("Error", error ?? "")
            }
            if let placemark = placemarks?.first {
                coordinates = placemark.location!.coordinate
                coordCallback(coordinates)
            }
        })
    }
    
    func coordCallback(_ coordinates: CLLocationCoordinate2D) {
        print(coordinates)
        self.coords = coordinates
    }
    
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Kebabbaro.self, configurations: config)
        let k = Kebabbaro(name: "Matteotti Turkish Kebab Pizzeria", imageName: "matteottikebab", address: "Piazza matteotti, Bolzano bz", points: 100)
        return EditKebabbaroView(kebabbaro: k).modelContainer(container)
    } catch {
        fatalError()
    }
}
