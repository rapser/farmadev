//
//  ContentConfigDTOMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension ContentConfigDTO {

    func toDomain() -> ContentConfig {
        ContentConfig(
            defaultZoomForMap: defaultZoomForMap ?? 15,
            messageForDirectSearch: messageForDirectSearch ?? "",
            thereIsNoStoreWithStock: thereIsNoStoreWithStock ?? "",
            delayForPredictiveAddresses: delayForPredictiveAddresses ?? 0,
            messageForRequiredGeolocation: messageForRequiredGeolocation ?? "",
            suggestedMessageForPredictiveAddresses: suggestedMessageForPredictiveAddresses ?? "",
            minimunCharactersForPredictiveAddresses: minimunCharactersForPredictiveAddresses ?? 0,
            tagRet: tagRet ?? ""
        )
    }
}
