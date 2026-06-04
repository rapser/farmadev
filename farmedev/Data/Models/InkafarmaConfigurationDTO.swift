//
//  InkafarmaConfigurationDTO.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

struct InkafarmaConfigurationDTO: Codable {
    let id: String?
    let title: String?
    let configId: String?
    let configuration: ConfigurationDTO?
    
    // Modelos auxiliares incluidos directamente
    enum ConfigurationDTO: Codable {
        case inkafarmaConfig(InkafarmaConfigItemDTO)
        case cardConfig(CardConfigurationDTO)
        case omnicanalConfig(OmnicanalConfigurationDTO)
        
        struct InkafarmaConfigItemDTO: Codable {
            let idCampaign: Int?
        }
        
        struct CardConfigurationDTO: Codable {
            let cardsAssociatedDefault: String?
            let cardsAssociated: [CardsAssociatedDTO]?
        }
        
        struct CardsAssociatedDTO: Codable {
            let id: String?
            let name: String?
            let valueTalon: String?
            let text: String?
            let image: String?
            let textSubTotal: String?
            let textTotal: String?
            let textSavedMoney: String?
        }
        
        struct OmnicanalConfigurationDTO: Codable {
            let quantity: String?
            let statusModal: String?
            let title: String?
            let imageUrl: String?
            let text: String?
            let button: String?
        }
    }
}
