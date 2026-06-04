//
//  ShowcaseUI.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

struct ShowcaseUI {
    let title: String
    let section: String
    let banners: [ShowcaseBannerUI]
    
    struct ShowcaseBannerUI: Identifiable {
        let id: String
        let imageUrl: String
        let link: String
    }
}
