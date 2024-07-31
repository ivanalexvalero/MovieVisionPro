//
//  ContentView.swift
//  MovieVisionPro
//
//  Created by Ivan Alexander Valero on 11/06/2024.
//

import SwiftUI
import RealityKit
//import RealityKitContent

struct ContentView: View {
    @Environment(MovieViewModel.self) private var movieViewModel
    
    var body: some View {
        @Bindable var bindableViewModel = movieViewModel
        TabView {
//            MovieView()
            
            
            NavigationSplitView {
                    List {
                        ForEach(sidePerfilUserMenu.self){ item in
                            Label(item.title, systemImage: item.icon)
                        }
                    }
                    .navigationSplitViewColumnWidth(250)
                .toolbar {
                    ToolbarItemGroup(placement: .topBarLeading) {
                        VStack(alignment: .leading) {
                            Text("Series")
                                .font(.largeTitle)
                            Text("48 series")
                                .foregroundStyle(.tertiary)
                        }
                    }
                }
            } detail: {
                
            }

        }
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
        .environment(MovieViewModel())
}
