//
//  ApiClientMock.swift
//  TechnologyAssessment
//
//  Created by Islam Elshazly on 18/05/2023.
//

import Foundation

@testable
import TechnologyAssessment

final class ApiClientMock: ApiClient {
    
    enum APIError: Error {
        case unknown
        case networkError
        case errorDecode
    }
    
    private let error: Error?
    private var data: Data?
    
    init(data: Data? = nil, error: Error? = nil) {
        self.data = data
        self.error = error
    }
    
    func execute<T>(request: Endpoints, completionHandler: @escaping APIResultHandler<T>) where T : Decodable {
        if let data = data {
            do {
                let decodedData = try T.decode(from: data)
                completionHandler(.success(decodedData))
            } catch {
                completionHandler(.failure(APIError.errorDecode))
            }
         } else if let error = error {
             completionHandler(.failure(error))
         } else {
             completionHandler(.failure(APIError.unknown))
         }
    }
}
