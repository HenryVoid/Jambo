//
//  CardListEndpoint.swift
//  Jambo
//
//  Created by 송형욱 on 1/22/25.
//

import Foundation
import NetworkKit

enum CardListEndpoint {
    case getCardList(id: String?)
}

extension CardListEndpoint: API.Endpoint {
    var baseURL: any API.URLConvertible { Env.BASE_URL }
    var path: String? { "/api/v1/card" }
    var method: API.HTTPMethod { .get }
    var headers: API.HttpHeaders? { .none }
    var parameters: API.Parameters? {
        switch self {
        case .getCardList(let id):
            guard let id else { return nil }
            return ["page": id]
        }
    }
    var encoder: any API.ParameterEncodable { .url }
}
