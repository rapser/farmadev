//
//  PredictiveDTOMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension PredictiveDTO {

    func toDomain() -> Predictive {
        Predictive(
            text: text ?? "",
            keywords: keywords?.map { $0.toDomain() } ?? []
        )
    }
}

extension PredictiveDTO.PredictiveKeywordDTO {
    func toDomain() -> Predictive.PredictiveKeyword {
        Predictive.PredictiveKeyword(
            keyword: keyword ?? ""
        )
    }
}
