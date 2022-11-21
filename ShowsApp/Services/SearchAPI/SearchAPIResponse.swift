//
//  SearchAPIResponse.swift
//  ShowsApp
//
//  Created by COBE on 27.10.2022..
//

import Foundation
import SwiftUI

struct SearchAPIResponse: Codable {
    
    let show: Show?
    
    struct Show: Codable {
        let id: Int
        let name: String
        let premiered: String
        let image: Image?
        let summary: String?
        
        var yearDate: String {
            let index = premiered.index(premiered.startIndex, offsetBy: 4)
            let mySubstring = premiered[..<index]
            return String(mySubstring)
        }
        
    }
    
    
    struct Image: Codable {
        let medium: URL?
        let original: URL?
    }
    
    
}
