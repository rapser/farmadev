//
//  InkafarmaConfigurationDTOMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension InkafarmaConfigurationDTO {

    func toDomain() -> InkafarmaConfiguration {
        InkafarmaConfiguration(
            id: id ?? "",
            title: title ?? "",
            configId: configId ?? "",
            configuration: configuration?.toDomain()
        )
    }
}

extension InkafarmaConfigurationDTO.ConfigurationDTO {
    func toDomain() -> InkafarmaConfiguration.Configuration? {
        switch self {
        case .inkafarmaConfig(let item):
            return .inkafarmaConfig(InkafarmaConfiguration.Configuration.InkafarmaConfigItem(
                idCampaign: item.idCampaign ?? 0
            ))
        case .cardConfig(let config):
            return .cardConfig(InkafarmaConfiguration.Configuration.CardConfiguration(
                cardsAssociatedDefault: config.cardsAssociatedDefault ?? "",
                cardsAssociated: config.cardsAssociated?.map { $0.toDomain() } ?? []
            ))
        case .omnicanalConfig(let config):
            return .omnicanalConfig(InkafarmaConfiguration.Configuration.OmnicanalConfiguration(
                quantity: config.quantity ?? "",
                statusModal: config.statusModal ?? "",
                title: config.title ?? "",
                imageUrl: config.imageUrl ?? "",
                text: config.text ?? "",
                button: config.button ?? ""
            ))
        }
    }
}

extension InkafarmaConfigurationDTO.ConfigurationDTO.CardsAssociatedDTO {
    func toDomain() -> InkafarmaConfiguration.Configuration.CardsAssociated {
        InkafarmaConfiguration.Configuration.CardsAssociated(
            id: id ?? "",
            name: name ?? "",
            valueTalon: valueTalon ?? "",
            text: text ?? "",
            image: image ?? "",
            textSubTotal: textSubTotal ?? "",
            textTotal: textTotal ?? "",
            textSavedMoney: textSavedMoney ?? ""
        )
    }
}
