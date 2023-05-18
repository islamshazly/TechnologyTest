//
//  Endpoints.swift
//  TechnologyAssessment
//
//  Created by Islam Elshazly on 16/05/2023.
//

import Moya

// MARK: - Endpoints Enum
enum Endpoints {
    
    case mostViewed(pastDays: Int)
}

// MARK: - API

extension Endpoints: TargetType, AccessTokenAuthorizable {
    
    var baseURL: URL {
        return URL(string: Constants.baseURl)!
    }
    
    var path: String {
        switch self {
        case let .mostViewed(pastDays):
            return Constants.mostViewed + "/\(pastDays).json"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .mostViewed:
            return .get
        }
    }
    
    var parameters: [String: Any]?  {
        //TODO: Should be hashed
        return ["api-key": "xQh99WGa9gmByndkK1ocqT7ps3GTfhxu"]
    }
    var parameterEncoding: ParameterEncoding {
        if self.method == .get {
            return URLEncoding.queryString
        } else if self.method == .post {
            return JSONEncoding.default
        } else if self.method == .patch {
            return JSONEncoding.default
        }
        return URLEncoding.default
    }
    
    var task: Moya.Task {
        return .requestParameters(parameters: parameters!, encoding: parameterEncoding)
    }
    
    var headers: [String : String]? {
        return [:]
    }
    
    var authorizationType: Moya.AuthorizationType? {
        return .none
    }
}
