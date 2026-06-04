//
//  InkafarmaConfiguration.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

struct InkafarmaConfiguration {
    let id: String
    let title: String
    let configId: String
    let configuration: Configuration?
    
    // Modelos auxiliares incluidos directamente
    enum Configuration {
        case inkafarmaConfig(InkafarmaConfigItem)
        case cardConfig(CardConfiguration)
        case omnicanalConfig(OmnicanalConfiguration)
        
        struct InkafarmaConfigItem {
            let idCampaign: Int
        }
        
        struct CardConfiguration {
            let cardsAssociatedDefault: String
            let cardsAssociated: [CardsAssociated]
        }
        
        struct CardsAssociated {
            let id: String
            let name: String
            let valueTalon: String
            let text: String
            let image: String
            let textSubTotal: String
            let textTotal: String
            let textSavedMoney: String
        }
        
        struct OmnicanalConfiguration {
            let quantity: String
            let statusModal: String
            let title: String
            let imageUrl: String
            let text: String
            let button: String
        }
    }
}
