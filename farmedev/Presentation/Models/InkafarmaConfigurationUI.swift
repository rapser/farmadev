//
//  InkafarmaConfigurationUI.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

struct InkafarmaConfigurationUI: Identifiable {
    let id: String
    let title: String
    let configId: String
    let configuration: ConfigurationUI
    
    enum ConfigurationUI {
        case inkafarmaConfig(idCampaign: Int)
        case cardConfig(defaultCard: String, cards: [CardUI])
        case omnicanalConfig(title: String, text: String, imageUrl: String)
        
        struct CardUI: Identifiable {
            let id: String
            let name: String
            let imageUrl: String
        }
    }
}
