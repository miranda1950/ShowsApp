//
//  ScheduleSliderView.swift
//  ShowsApp
//
//  Created by COBE on 20.10.2022..
//

import SwiftUI

struct ScheduleSliderView: View {
    
    var schedule: ScheduleAPIResponse
    
    var body: some View {
        VStack {

            AsyncImage(url: schedule.show.image?.medium) {
                image in
                image
                    .resizable()
                    .scaledToFit()
                
            } placeholder: {
                ProgressView()
                    .progressViewStyle(.circular)
            }
            .clipShape(RoundedRectangle(cornerRadius: 10))
            
            
            VStack(alignment: .leading) {
                HStack {
                    Spacer()
                    
                    Text(schedule.airtime)
                        .foregroundColor(Color("LightGray"))
                        .font(.caption)
                    
                }
            }
            
            HStack{
                Text(schedule.show.name)
                    .foregroundColor(Color("LightGray"))
                    .lineLimit(1)
                    .padding(.leading,5)
                Spacer()
            }
            
            
        }
    }
}

/*struct ScheduleSliderView_Previews: PreviewProvider {
 static var previews: some View {
 ScheduleSliderView(schedule: ScheduleAPIResponse)
 }
 }
 */
