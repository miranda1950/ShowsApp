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
                
                
            VStack(alignment: .leading) {
            HStack {
                Image(systemName: "star.fill")
                    .foregroundColor(Color("PrimaryYellow"))
                    .scaledToFit()
                    
                
                
                Text(String(movie.rating.average ?? 0.0))
                    .foregroundColor(Color("LightGray"))
            }
            
            Text(movie.name)
                .foregroundColor(Color("LightGray"))
        }
        }
    }
}


/*struct HomeSliderView_Previews: PreviewProvider {
    static var previews: some View {
        HomeSliderView(movie: ShowsAPIResponse)
    }
} */

/*VStack {
    AsyncImage(url: movie.image.medium)
        .scaledToFit()
        .frame(width: geo.size.width * 0.5, height: geo.size.height * 0.5)
        .padding(.leading, 5)
    
    VStack(alignment: .leading){
    HStack {
        Image(systemName: "star.fill")
            .foregroundColor(Color("PrimaryYellow"))
        
        Text(String(movie.rating.average ?? 0.0))
            .foregroundColor(Color("LightGray"))
    }
    }
    VStack {
        
        Text(movie.name)
            .foregroundColor(Color("LightGray"))
       
            
    }
} */
