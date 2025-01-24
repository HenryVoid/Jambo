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
    struct List: Codable, Sendable {
        let cardType: String?
        let profile: Profile?
        let card: Card?
    }

    // MARK: - Card
    struct Card: Codable, Sendable {
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
    struct ProfileImage: Codable, Sendable {
        let width, height: Int?
        let imageURL: String?

        enum CodingKeys: String, CodingKey {
            case width, height
            case imageURL = "imageUrl"
        }
        
        static let mock: Self = .init(width: 40, height: 40, imageURL: "")
    }

    // MARK: - Category
    struct Category: Codable, Sendable {
        let name: String?
        let imageURL: String?

        enum CodingKeys: String, CodingKey {
            case name
            case imageURL = "imageUrl"
        }
    }

    // MARK: - Connect
    struct Connect: Codable, Sendable {
        let status: String?
        let userCount: Int?
        let messageList: [MessageList]?
    }

    // MARK: - MessageList
    struct MessageList: Codable, Sendable {
        let nickName: String?
        let body: Body?
        let profileImage: ProfileImage?
        let sendAt: Int?
    }

    // MARK: - Body
    struct Body: Codable, Sendable {
        let type: String?
        let value: Value?
    }

    enum Value: Codable, Sendable {
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
    struct Profile: Codable, Sendable {
        let nickName: String?
        let location: Location?
        let profileImage: ProfileImage?
    }

    // MARK: - Location
    struct Location: Codable, Sendable {
        let longitude, latitude: Double?
    }
}
