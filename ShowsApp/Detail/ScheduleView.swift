//
//  ScheduleView.swift
//  ShowsApp
//
//  Created by COBE on 24.10.2022..
//

import SwiftUI

struct ScheduleView: View {
    
    var schedule: ScheduleAPIResponse
    let cast: [CastAPIResponse]
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
                .font(.caption)
                .lineLimit(4)
            VStack {
                HStack {
                    Text("Cast")
                        .font(.title2)
                        .foregroundColor(Color("LightGray"))
                    Spacer()
                    Text("show all")
                        .foregroundColor(Color("PrimaryYellow"))
                        .font(.subheadline)
                        .fontWeight(.bold)
                }
                
              
            }
            .padding(.leading, 5)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(cast, id:\.person?.id) { person in
                     
                        VStack {
                            VStack {
                                AsyncImage(url: person.person?.image?.medium) {
                                image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .scaledToFit()
                                   
                                    
                            } placeholder: {
                                ProgressView()
                                    .progressViewStyle(.circular)
                            }
                            }
                            .frame(width: 90, height: 120)
                      
                          Text(person.person?.name ?? "N/a")
                                .foregroundColor(Color("LightGray"))
                                .font(.caption)
                                .lineLimit(1)
                            
                          
                    }
                        
                        
                    }
                    
                }
            }
        
   
        }

    }
}

/*struct ScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleView()
    }
}
 */
