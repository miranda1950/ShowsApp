//
//  HomeSliderView.swift
//  ShowsApp
//
//  Created by COBE on 20.10.2022..
//

import SwiftUI


struct HomeSliderView: View {
    
    var movie: ShowsAPIResponse
    @ObservedObject var viewModel = HomeViewModel<Any>(showsAPIService: ShowsAPIService(), scheduleAPIService: ScheduleAPIService(), castAPIService: CastAPIService(), persistanceService: PersistanceService())
    
    var body: some View {
        
        ZStack(alignment: .topLeading) {
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
            ZStack(alignment: .topLeading) {

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
                            viewModel.markFavoriteShow(movie)
                            viewModel.favoriteChecked(viewModel.showFavs)
                        }
                 
                    
                    
                    Image(systemName: viewModel.showFavs ? "heart.fill" : "heart")
                        .foregroundColor(Color("PrimaryYellow"))
                    
                }
                .padding(.leading, 10)

            }
        
    }
    }
}


/*struct HomeSliderView_Previews: PreviewProvider {
 static var previews: some View {
 HomeSliderView(movie: ShowsAPIResponse)
 }
 } */

//ZStack(alignment: .topLeading) {
//
//    ZStack {
//        Rectangle()
//            .frame(width: 30, height: 30)
//            .clipShape(RoundedRectangle(cornerRadius: 5))
//            .background(Color("DarkGray"))
//            .overlay {
//                RoundedRectangle(cornerRadius: 5)
//                    .stroke(Color("LightGray"), lineWidth: 1)
//
//            }
//            .onTapGesture{
//                viewModel.markFavoriteShow(movie)
//
//            }
//
//        Image(systemName: viewModel.showFavs ? "heart" : "heart.fill")
//            .foregroundColor(Color("PrimaryYellow"))
//
//
//    }
//    .padding(.leading, 10)
//
//}
