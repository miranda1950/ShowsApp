//
//  ScheduleSliderView.swift
//  ShowsApp
//
//  Created by COBE on 20.10.2022..
//

import SwiftUI

struct ScheduleSliderView: View {
    
    var schedule: ScheduleAPIResponse
    @ObservedObject var viewModel = HomeViewModel<Any>(showsAPIService: ShowsAPIService(), scheduleAPIService: ScheduleAPIService(), castAPIService: CastAPIService(), persistanceService: PersistanceService())
    
    var body: some View {
        
        VStack {
            
            ZStack(alignment: .topLeading) {
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
                
                ZStack {
                    Rectangle()
                        .frame(width: 30, height: 30)
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                        .background(Color("DarkGray"))
                        .overlay {
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color("LightGray"), lineWidth: 1)
                            
                        }
                        .onTapGesture{
                            viewModel.markFavoriteSchedule(schedule)
                            
                        }
                    
                    
                    Image(systemName:"heart.fill" )
                        .foregroundColor(viewModel.isScheduleFavorite(schedule) ? Color("PrimaryYellow") : Color("LightGray"))
                    
                    
                    
                }
                
            }
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
