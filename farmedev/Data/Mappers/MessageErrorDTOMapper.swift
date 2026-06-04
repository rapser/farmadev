//
//  MessageErrorDTOMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension MessageErrorDTO {

    func toDomain() -> MessageError {
        MessageError(
            code: code ?? 0,
            title: title ?? "",
            message: message ?? ""
        )
    }
}
