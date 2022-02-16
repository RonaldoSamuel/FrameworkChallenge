//
//  JsonRouter.swift
//  FrameworkChallange
//
//  Created by Ronaldo Filho on 16/02/22.
//

import Foundation
import Alamofire

enum JsonRouter: APIConfiguration {
    
    case album
    case post
    case todo
    
    var method: HTTPMethod {
        switch self {
        default:
            return .get
        }
    }
    var parameters: RequestParams {
        switch self {
        default:
            return .url([:])
        }
    }
    
    var path: String {
        switch self {
        case .album:
            return "/albums"
        case .todo:
            return "/todos"
        case .post:
            return "/posts"
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = try Constants.API.baseURL.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        urlRequest.httpMethod = method.rawValue
        
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        
        
        let components = URLComponents(string: url.appendingPathComponent(path).absoluteString)
        urlRequest.url = components?.url
        
        return urlRequest
    }
}
