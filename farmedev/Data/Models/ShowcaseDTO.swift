//
//  ShowcaseDTO.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

struct ShowcaseDTO: Codable {
    let type: String?
    let section: String?
    let title: String?
    let link: String?
    let products: [String]?
    let gaEventAction: String?
    let gaEventCategory: String?
    let gaEventLabel: String?
    let template: ShowcaseTemplateDTO?
    
    // Modelos auxiliares incluidos directamente
    struct ShowcaseTemplateDTO: Codable {
        let type: String?
        let banners: [ShowcaseBannerDTO]?
    }
    
    struct ShowcaseBannerDTO: Codable {
        let urlImage: String?
        let link: String?
    }
}
