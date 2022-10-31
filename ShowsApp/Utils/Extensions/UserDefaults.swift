//
//  UserDefaults.swift
//  ShowsApp
//
//  Created by COBE on 29.10.2022..
//

import Foundation

extension UserDefaults {
    
    func load<T>() -> T? where T: Decodable {
        
        let decoder = JSONDecoder()
        
        let key = "\(T.self)"
        guard let data = self.object(forKey: key) as? Data else {
            return nil
        }
        return try? decoder.decode(T.self, from: data)
    }
    
    func save<T>(_ t: T) where T: Encodable {
        let encoder = JSONEncoder()
        
        guard let data = try? encoder.encode(t) else { return }
        
        let key = "\(T.self)"
        self.set(data, forKey: key)
    }
}
