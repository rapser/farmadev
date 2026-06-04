//
//  InkafarmaConfigurationUIMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension InkafarmaConfiguration {

    func toUI() -> InkafarmaConfigurationUI {
        let configUI: InkafarmaConfigurationUI.ConfigurationUI
        
        switch configuration {
        case .inkafarmaConfig(let item):
            configUI = .inkafarmaConfig(idCampaign: item.idCampaign)
        case .cardConfig(let config):
            configUI = .cardConfig(
                defaultCard: config.cardsAssociatedDefault,
                cards: config.cardsAssociated.map { $0.toUI() }
            )
        case .omnicanalConfig(let config):
            configUI = .omnicanalConfig(
                title: config.title,
                text: config.text,
                imageUrl: config.imageUrl
            )
        case .none:
            configUI = .omnicanalConfig(title: "", text: "", imageUrl: "")
        }
        
        return InkafarmaConfigurationUI(
            id: id,
            title: title,
            configId: configId,
            configuration: configUI
        )
    }
}

extension InkafarmaConfiguration.Configuration.CardsAssociated {
    func toUI() -> InkafarmaConfigurationUI.ConfigurationUI.CardUI {
        InkafarmaConfigurationUI.ConfigurationUI.CardUI(
            id: id,
            name: name,
            imageUrl: image
        )
    }
}
