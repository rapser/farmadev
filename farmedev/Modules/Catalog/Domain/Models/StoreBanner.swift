//
//  StoreBanner.swift
//  farmedev
//

import Foundation

struct StoreBanner: Identifiable, Equatable {
    let id: String
    let placement: String
    let imageUrl: String
    let title: String?
    let actionType: String
    let actionValue: String?
}
