//
//  ARServiceManager.swift
//  Agri Reach
//
//  Created by Rafiudeen on 19/05/22.
//

import Foundation

///https://tsd.shtdevops.xyz/where2go/

struct API {
    static var scheme = "https"
    
    static var baseURL = "tsd.shtdevops.xyz" //dev

    static var path = ""
    static var port = 0
}

enum HttpMethod: String {
    case get
    case post
    case put
    case PATCH
    case delete
}

enum ContentType : String {
    case formData = "multipart/form-data"
    case json = "application/json"
    case x_www_form_urlEncoded = "application/x-www-form-urlencoded"
    case Authorization = "Bearer "
    
}

enum ARServiceManager {
    
    case basecase
    case login(_ request: LoginRequest)

    var scheme: String {
        switch self {
        case .basecase: return API.scheme
        case .login: return API.scheme


        }
    }
    
    var host: String {
        switch self {
            
        case .basecase: return ""
        case .login: return API.baseURL



        }
    }
    
    var path: String {
        switch self {
            
        case .basecase: return "/where2go/api/login"
        case .login: return "/where2go/api/v1/login"


        }
    }
    
    var method: String {
        switch self {
        case .basecase: return HttpMethod.post.rawValue
        case .login: return HttpMethod.post.rawValue


        }
    }
    
    var parameters: [URLQueryItem]? {
        switch self {
        case .basecase: return nil
        case .login: return nil


        }
        
    }
    
    var body: Data? {
        switch self {
            
        case .basecase: return nil
        case .login(let request):
            print(request)
            let encoder = JSONEncoder()
            return try? encoder.encode(request)

        }
    }
    
    
    var formDataParameters : [URLQueryItem]? {
        switch self {
        case .basecase : return nil
        case .login : return nil


        }
    }
    
    var headerFields: [String : String] {
        let commonHeader : [String:String] = ["Content-Type" : ContentType.json.rawValue,"Authorization": "Bearer \(User.shared.token)"]
        switch self {
            
        case .basecase: return ["Content-Type" : ContentType.json.rawValue, "Accept":"*/*"]
        case .login: return ["Content-Type" : ContentType.json.rawValue, "Accept":"*/*"]


        }
    }
}
