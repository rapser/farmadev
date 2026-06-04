//
//  FavoriteDTOMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension FavoriteDTO {

    func toDomain() -> Favorite {
        Favorite(
            favorites: favorites?.map { $0.toDomain() } ?? []
        )
    }
}
