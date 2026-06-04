//
//  FavoriteUIMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension Favorite {

    func toUI() -> FavoriteUI {
        FavoriteUI(
            favorites: favorites.map { $0.toUI() }
        )
    }
}
