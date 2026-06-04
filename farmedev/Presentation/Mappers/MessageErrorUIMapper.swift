//
//  MessageErrorUIMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension MessageError {

    func toUI() -> MessageErrorUI {
        MessageErrorUI(
            title: title,
            message: message
        )
    }
}
