//
//  MovieView.swift
//  ShowsApp
//
//  Created by COBE on 24.10.2022..
//

import SwiftUI

struct MovieView: View {
    
    var movie: ShowsAPIResponse
    
    var body: some View {
       
        VStack {
            AsyncImage(url: movie.image.original, content: { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                  
            }, placeholder: { ProgressView()
            }
            )
            
          Text(movie.niceSummary)
                .foregroundColor(Color("LightGray"))
                .font(.system(size: 14))
        
        }
        
    }
}

/*struct MovieView_Previews: PreviewProvider {
    static var movie =  Self.Previews
    static var previews: some View {
        MovieView(movie: movie)
    }
} */
