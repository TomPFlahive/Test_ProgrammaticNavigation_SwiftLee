//
//  FavoritesStore.swift
//  Test_ProgrammaticNavigation_SwiftLee
//
//  Created by Tom Flahive on 3/24/23.
//

import SwiftUI

final class FavoritesStore: ObservableObject {
    static let standard = FavoritesStore()

    @Published var favorites: [String] = ["Swift", "SwiftUI", "UIKit"]

    func add(_ favorite: String) {
        favorites.append(favorite)
    }

    func remove(_ favorite: String) {
        favorites.removeAll(where: { $0 == favorite })
    }
}
