//
//  CardModel+ProfileModel.swift
//  Jambo
//
//  Created by 송형욱 on 1/24/25.
//

import Foundation

extension CardModel {
    struct ProfileModel: Sendable, Hashable {
        var nickname: String
        var createdAt: Double
        let longitude, latitude: Double
        var image: ImageModel
        
        init(nickname: String, createdAt: Double, longitude: Double, latitude: Double, image: ImageModel) {
            self.nickname = nickname
            self.createdAt = createdAt
            self.longitude = longitude
            self.latitude = latitude
            self.image = image
        }
        
        init?(dto response: CardListDTO.Profile?, createdAt: Double?) {
            guard let response,
                  let nickName = response.nickName,
                  let location = response.location,
                  let image = ImageModel(dto: response.profileImage),
                  let createdAt = createdAt else {
                return nil
            }
            self.nickname = nickName
            
            self.latitude = location.latitude ?? 0
            self.longitude = location.longitude ?? 0
            self.createdAt = createdAt
            self.image = image
        }
    }
}

extension CardModel.ProfileModel {
    static let mock: Self = .init(
        nickname: "Tiffany",
        createdAt: 1737355272282,
        longitude: -73.707902000000004,
        latitude: 40.743143000000003,
        image: .init(
            width: 40,
            height: 40,
            url: ""
//            url: "https://jambo-homework.s3.ap-northeast-2.amazonaws.com/thumbnail/Thumbnail_8.png"
        )
    )
}
