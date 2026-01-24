//
//  ContentConfigUIMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension ContentConfig {

    func toUI() -> ContentConfigUI {
        ContentConfigUI(
            defaultZoom: defaultZoomForMap,
            directSearchMessage: messageForDirectSearch,
            noStoreMessage: thereIsNoStoreWithStock,
            geolocationMessage: messageForRequiredGeolocation
        )
    }
}
