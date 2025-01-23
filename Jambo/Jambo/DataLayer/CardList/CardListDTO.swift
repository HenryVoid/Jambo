//
//  CardListDTO.swift
//  Jambo
//
//  Created by 송형욱 on 1/22/25.
//

import Foundation

enum CardListDTO {
    struct Response: Decodable {
        let list: [List]?
        let hasNext: Bool?
    }
    
    // MARK: - List
    struct List: Codable {
        let cardType: String?
        let profile: Profile?
        let card: Card?
    }

    // MARK: - Card
    struct Card: Codable {
        let cardType, cardID: String?
        let category: Category?
        let body: String?
        let cardImage: [ProfileImage]?
        let connect: Connect?
        let createdAt: Int?

        enum CodingKeys: String, CodingKey {
            case cardType
            case cardID = "cardId"
            case category, body, cardImage, connect, createdAt
        }
    }

    // MARK: - ProfileImage
    struct ProfileImage: Codable {
        let width, height: Int?
        let imageURL: String?

        enum CodingKeys: String, CodingKey {
            case width, height
            case imageURL = "imageUrl"
        }
    }

    // MARK: - Category
    struct Category: Codable {
        let name: String?
        let imageURL: String?

        enum CodingKeys: String, CodingKey {
            case name
            case imageURL = "imageUrl"
        }
    }

    // MARK: - Connect
    struct Connect: Codable {
        let status: String?
        let userCount: Int?
        let messageList: [MessageList]?
    }

    // MARK: - MessageList
    struct MessageList: Codable {
        let nickName: String?
        let body: Body?
        let profileImage: ProfileImage?
        let sendAt: Int?
    }

    // MARK: - Body
    struct Body: Codable {
        let type: String?
        let value: Value?
    }

    enum Value: Codable {
        case profileImage(ProfileImage)
        case string(String)

        init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            if let x = try? container.decode(String.self) {
                self = .string(x)
                return
            }
            if let x = try? container.decode(ProfileImage.self) {
                self = .profileImage(x)
                return
            }
            throw DecodingError.typeMismatch(Value.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for Value"))
        }

        func encode(to encoder: Encoder) throws {
            var container = encoder.singleValueContainer()
            switch self {
            case .profileImage(let x):
                try container.encode(x)
            case .string(let x):
                try container.encode(x)
            }
        }
    }

    // MARK: - Profile
    struct Profile: Codable {
        let nickName: String?
        let location: Location?
        let profileImage: ProfileImage?
    }

    // MARK: - Location
    struct Location: Codable {
        let longitude, latitude: Double?
    }
}
