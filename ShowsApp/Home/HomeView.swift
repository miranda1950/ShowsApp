//
//  HomeView.swift
//  ShowsApp
//
//  Created by COBE on 17.10.2022..
//

import SwiftUI
import UIKit


struct HomeView: View {
    
    @ObservedObject var viewModel = HomeViewModel(showsAPIService: ShowsAPIService())
    
    
    var body: some View {
        GeometryReader { geo in
        VStack {
            HStack {
            Text("Shows")
                .foregroundColor(Color("LightGray"))
                .font(.title)
                .fontWeight(.bold)
                .padding()
            Spacer()
              Text("show all")
                    .foregroundColor(Color("PrimaryYellow"))
                    .font(.subheadline)
                    .fontWeight(.bold)
            }
            

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                    ForEach(viewModel.movies) { movie in
                        VStack {
                            
                    HomeSliderView(movie: movie)
   
            }
            .frame(width: geo.size.width * 0.50, height: geo.size.height * 0.50)
            }
                       
                }
                }
            .frame(width: geo.size.width, height: geo.size.height * 0.50)
            .background(Color("DarkGray"))
            
            }
        
     
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
        .onAppear {
            viewModel.loadShows()
        }
        
}
    
        
}
    

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: HomeViewModel(showsAPIService: ShowsAPIService()))
    }
}
