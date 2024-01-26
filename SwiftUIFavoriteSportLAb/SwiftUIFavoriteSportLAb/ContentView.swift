//
//  ContentView.swift
//  SwiftUIFavoriteSportLAb
//
//  Created by Austin Dobberfuhl on 1/18/24.
//

import SwiftUI

struct ContentView: View {
    
    enum Sport: String {
        case golf, football, soccer, baseball
    }
    
    var opacity = 0.4
    var highlightedOpacity = 1.0
    
    @State var selectedSport = Sport.golf
        
    @State var isShowingResult = false
    
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack() {
                Spacer()
                
                Text("Favorite Sport")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                
                Spacer()
                
                HStack {
                    sportButton(.golf)
                    sportButton(.football)
                }
                
                HStack {
                    HStack {
                        sportButton(.soccer)
                        sportButton(.baseball)
                    }

                }
                
                Spacer()
                
                Button(action: {
                    isShowingResult = true
                    
                }, label: {
                    Text("Submit")
                    
                })
                .padding()
                .buttonStyle(.borderedProminent)
                .foregroundStyle(.white)
                .frame(width: 300)
                    
                if isShowingResult {
                    Text("You Chose \(selectedSport.rawValue)")
                        .foregroundStyle(.white)
                        .padding()
                } else {
                    Text("You chose")
                        .hidden()
                }
                
                Spacer()
                
               
                
                Spacer()
            }
        }
//        .frame(maxWidth: .infinity, maxHeight: .infinity)
//        .background(
//            Color.black
//                .ignoresSafeArea()
        
//        )
//        .padding()
    }
    
    func sportButton(_ sport: Sport) -> some View {
        Button( action: {
            select(sport)
            isShowingResult = false
            
        }
    , label: {
            Text("\(sport.rawValue)")
                .frame(width: 80, height: 80)
                
                .foregroundStyle(.white)
        }).buttonStyle(.borderedProminent)
            .tint(Color.green)
            .opacity(sport == selectedSport ? highlightedOpacity : opacity)

    }
    
    func select(_ sport: Sport) {
        selectedSport = sport
    }
    
}

//struct Sport: Identifiable {
//    var id = UUID()
//    var title: String
//}
//
//extension Sport {
//    static var listOfSports: [Sport] = [Sport(title: "Golf"),
//    Sport(title: "Football"),
//    Sport(title: "Soccer"),
//    Sport(title: "Baseball")]
//}

//struct FavoriteSportView: View {
//    @State var FavoriteSport: Sport
//    var body: some View {
//        HStack {
//            Button {
//                
//            }
//            
//            
//        }
//        
//        
//    }
//}
    
#Preview {
    ContentView()
}
