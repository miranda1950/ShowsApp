//
//  ScheduleView.swift
//  ShowsApp
//
//  Created by COBE on 24.10.2022..
//

import SwiftUI

struct ScheduleView: View {
    
    var schedule: ScheduleAPIResponse
    
    var body: some View {
        VStack {
            AsyncImage(url: schedule.show.image?.original, content: { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                  
            }, placeholder: { ProgressView()
            }
            )
            
            Text(schedule.show.summary ?? "N/A")
                .foregroundColor(Color("LightGray"))
                .font(.system(size: 14))
        
        }
    }
}

/*struct ScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleView()
    }
}
 */
