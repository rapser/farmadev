//
//  CoverageAreaDTOMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension CoverageAreaDTO {

    func toDomain() -> CoverageArea {
        CoverageArea(
            name: name ?? "",
            enabled: enabled ?? false,
            provinces: provinces?.map { $0.toDomain() } ?? []
        )
    }
}

extension CoverageAreaDTO.ProvinceAreaDTO {
    func toDomain() -> CoverageArea.ProvinceArea {
        CoverageArea.ProvinceArea(
            name: name ?? "",
            enabled: enabled ?? false,
            districts: districts?.map { $0.toDomain() } ?? []
        )
    }
}

extension CoverageAreaDTO.DistrictAreaDTO {
    func toDomain() -> CoverageArea.DistrictArea {
        CoverageArea.DistrictArea(
            name: name ?? "",
            enabled: enabled ?? false,
            img: img?.toDomain(),
            isNew: isNew ?? false
        )
    }
}

extension CoverageAreaDTO.ImageAreaDTO {
    func toDomain() -> CoverageArea.ImageArea {
        CoverageArea.ImageArea(
            XS: XS ?? "",
            SM: SM ?? "",
            MD: MD ?? "",
            LG: LG ?? ""
        )
    }
}
