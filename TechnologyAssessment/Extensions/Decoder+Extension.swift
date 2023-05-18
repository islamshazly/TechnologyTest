//
//  Decoder+Extension.swift
//  TechnologyAssessment
//
//  Created by Islam Elshazly on 16/05/2023.
//

import Foundation

extension Decodable {
    public static func decode(with decoder: JSONDecoder = JSONDecoder(), from data: Data) throws -> Self {
        return try decoder.decode(Self.self, from: data)
    }
}

extension Encodable {
    
    func encode() -> Data? {
        return try? JSONEncoder().encode(self)
    }
    
    func encodeToDic() -> [String: Any]? {
        let encoder = JSONEncoder()
         let data = try? encoder.encode(self)
         
         guard let data = data,
               let dictionary = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else {
             return nil
         }
        return dictionary
    }
}
