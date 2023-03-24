//
//  ContentView.swift
//  Test_ProgrammaticNavigation_SwiftLee
//
//  Created by Tom Flahive on 3/24/23.
//

import SwiftUI

struct FavoritesProgrammaticallyView: View {

    @ObservedObject var favoritesStore: FavoritesStore = .standard

    /// Store the favorite that has to be shown inside a detail view.
    @State var selectedFavorite: String?

    var body: some View {
        NavigationView {
            List(favoritesStore.favorites, id: \.self) { favorite in
                Button(favorite) {

                    /// Update `selectedFavorite` on tap.
                    selectedFavorite = favorite
                }.tint(Color.primary)
            }.navigationTitle("My Favorites")

                /// Whenever `selectedFavorite` is set, a new `FavoriteDetailView` is pushed.
                .navigationDestination(for: $selectedFavorite) { favorite in
                    FavoriteDetailView(favorite: favorite)
                }
        }
    }
}

struct FavoriteDetailView: View {

    let favorite: String

    var body: some View {
        VStack {
            Text("Opened favorite:")
            Text(favorite)
            Button("Remove from favorites") {
                FavoritesStore.standard.remove(favorite)
            }
        }
    }
}
