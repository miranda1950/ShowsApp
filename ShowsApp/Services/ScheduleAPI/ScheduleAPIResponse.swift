//
//  ScheduleAPIResponse.swift
//  ShowsApp
//
//  Created by COBE on 20.10.2022..
//

import Foundation
import SwiftUI

struct ScheduleAPIResponse:Identifiable,  Codable {
    
    let id: Int
      let airdate: String
      let airtime: String
      let show: Show
    
      struct Show: Codable{
      let image: Image?
          let name: String
      }
    
      struct Image: Codable{
        let original: URL?
        let medium: URL?
      }
    
    
    
}
