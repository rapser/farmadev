//
//  Showcase.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

struct Showcase {
    let type: String
    let section: String
    let title: String
    let link: String
    let products: [String]
    let gaEventAction: String
    let gaEventCategory: String
    let gaEventLabel: String
    let template: ShowcaseTemplate?
    
    // Modelos auxiliares incluidos directamente
    struct ShowcaseTemplate {
        let type: String
        let banners: [ShowcaseBanner]
    }
    
    struct ShowcaseBanner {
        let urlImage: String
        let link: String
    }
}
