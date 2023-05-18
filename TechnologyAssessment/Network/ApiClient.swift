//
//  ApiClient.swift
//  TechnologyAssessment
//
//  Created by Islam Elshazly on 16/05/2023.
//

import Moya

typealias APIResultHandler<T: Decodable> = (Result<T, Error>) -> Void
typealias APIEmptyResultHandler = (Result<Void, Error>) -> Void

// MARK: - APIService

protocol ApiClient {
    typealias APIResultHandler<T: Decodable> = (_ result: Result<T, Error>) -> Void
    func execute<T: Decodable>(request: Endpoints, completionHandler: @escaping APIResultHandler<T>)
}

// MARK: - APIServiceImplementation

final class ApiClientImplementation: ApiClient {
    
    // MARK: - Properties
    
    let provider: MoyaProvider<Endpoints>
    
    // MARK: - Init
    
    init(provider: MoyaProvider<Endpoints> = MoyaProvider<Endpoints>()) {
        self.provider = provider
    }
    
    // MARK: - API
    
    func execute<T>(request: Endpoints, completionHandler: @escaping APIResultHandler<T>) where T : Decodable {
        provider.request(request) { result in
            
            switch result {
            case let .success(moyaResponse):
                let data = moyaResponse.data
                do {
                    let decodedData = try T.decode(from: data)
                    completionHandler(.success(decodedData))
                } catch {
                    debugPrint(error)
                    completionHandler(.failure(error))
                }
            case let .failure(error):
                completionHandler(.failure(error))
            }
            
        }
    }
    
}
