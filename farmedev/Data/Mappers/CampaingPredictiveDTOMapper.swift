//
//  CampaingPredictiveDTOMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension CampaingPredictiveDTO {

    func toDomain() -> CampaingPredictive {
        CampaingPredictive(
            campaignCodes: campaignCodes ?? []
        )
    }
}
