//
//  HomeSliderView.swift
//  ShowsApp
//
//  Created by COBE on 20.10.2022..
//

import SwiftUI

struct HomeSliderView: View {
    
    var movie: ShowsAPIResponse
    
    
    var body: some View {
        
       
        VStack {
            AsyncImage(url: movie.image.medium)
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(.leading, 10)
                
                
                
            VStack(alignment: .leading) {
            HStack {
                Image(systemName: "star.fill")
                    .foregroundColor(Color("PrimaryYellow"))
                    .scaledToFit()

                Text(String(movie.rating.average ?? 0.0))
                    .foregroundColor(Color("LightGray"))
                Spacer()
            }
            
            
            Text(movie.name)
                .foregroundColor(Color("LightGray"))
        }
            .padding(.leading,10)
        }
        
    }
}


/*struct HomeSliderView_Previews: PreviewProvider {
    static var previews: some View {
        HomeSliderView(movie: ShowsAPIResponse)
    }
} */

