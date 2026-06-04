//
//  HomeSliderSection.swift
//  farmedev
//

import SwiftUI

struct HomeSliderSection: View {
    let slider: SliderBannerUI

    var body: some View {
        TabView {
            ForEach(slider.banners) { banner in
                AsyncImage(url: URL(string: banner.imageUrl)) { phase in
                    switch phase {
                    case .success(let img): img.resizable().scaledToFill()
                    case .failure:          Color.gray.opacity(0.3)
                    default:                ProgressView()
                    }
                }
                .frame(height: 160).clipped().cornerRadius(12)
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .automatic))
        .frame(height: 160)
    }
}
