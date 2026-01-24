//
//  ShowcaseDTOMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension ShowcaseDTO {

    func toDomain() -> Showcase {
        Showcase(
            type: type ?? "",
            section: section ?? "",
            title: title ?? "",
            link: link ?? "",
            products: products ?? [],
            gaEventAction: gaEventAction ?? "",
            gaEventCategory: gaEventCategory ?? "",
            gaEventLabel: gaEventLabel ?? "",
            template: template?.toDomain()
        )
    }
}

extension ShowcaseDTO.ShowcaseTemplateDTO {
    func toDomain() -> Showcase.ShowcaseTemplate {
        Showcase.ShowcaseTemplate(
            type: type ?? "",
            banners: banners?.map { $0.toDomain() } ?? []
        )
    }
}

extension ShowcaseDTO.ShowcaseBannerDTO {
    func toDomain() -> Showcase.ShowcaseBanner {
        Showcase.ShowcaseBanner(
            urlImage: urlImage ?? "",
            link: link ?? ""
        )
    }
}
