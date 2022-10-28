//
//  HomeView.swift
//  ShowsApp
//
//  Created by COBE on 17.10.2022..
//

import SwiftUI
import UIKit


struct HomeView: View {
    
    @ObservedObject var viewModel = HomeViewModel<Any>(showsAPIService: ShowsAPIService(), scheduleAPIService: ScheduleAPIService(), castAPIService: CastAPIService())
    
    @State private var count: Int = 0
    
    
    
    var body: some View {
        
        GeometryReader { geo in
            
            VStack {
                HStack {
                    Text("Shows")
                        .foregroundColor(Color("LightGray"))
                        .font(.title)
                        .fontWeight(.bold)
                    
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
                                ZStack(alignment: .topLeading) {
                                HomeSliderView(movie: movie)
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
                                                viewModel.markFavorite()
                                            }
                                        
                                        
                                        Image(systemName: "heart.fill")
                                            .foregroundColor(Color("LightGray"))
                                           
                                    }
                                    .padding(.leading, 10)
                                    
                                }
                            }
                            
                            .frame(width: geo.size.width * 0.52, height: geo.size.height * 0.50)
                            .onTapGesture {
                                viewModel.getActors(movie.id)
                                viewModel.onGoToDetails?(movie, viewModel.actors)
                            }
                            
                        }
                        
                    }
                }
                .frame(width: geo.size.width, height: geo.size.height * 0.50)
                .background(Color("DarkGray"))
                
                HStack(){
                    Text("Schedule")
                        .foregroundColor(Color("LightGray"))
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.leading, 10)
                    Spacer()
                    Text("show all")
                        .foregroundColor(Color("PrimaryYellow"))
                        .font(.subheadline)
                        .fontWeight(.bold)
                    
                }
                
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(viewModel.schedule) { schedule in
                            
                            VStack{
                                ZStack(alignment: .topLeading) {
                                ScheduleSliderView(schedule: schedule)
                                    ZStack {
                                        Rectangle()
                                            .frame(width: 30, height: 30)
                                            .clipShape(RoundedRectangle(cornerRadius: 5))
                                            .background(Color("DarkGray"))
                                            .overlay {
                                                RoundedRectangle(cornerRadius: 5)
                                                    .stroke(Color("LightGray"), lineWidth: 1)
                                            }
                                        
                                        
                                        Image(systemName: "heart.fill")
                                            .foregroundColor(Color("LightGray"))
                                    }

                                }
                            }
                            .frame(width: geo.size.width * 0.34, height: geo.size.height * 0.42)
                            .onTapGesture {
                                viewModel.getActors(schedule.show.id)
                                viewModel.onGoToDetails?(schedule, viewModel.actors)
                                
                            }
                        }
                        
                    }
                }
                .frame(width: geo.size.width, height: geo.size.height * 0.36)
                .background(Color("DarkGray"))
            }
            
            
        }
        .padding(.bottom, 20)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
        .onAppear {
            if count < 1 {
                DispatchQueue.main.async {
                    viewModel.loadShows()
                    viewModel.loadSchedule()
                    viewModel.emptyActorsField()
                    count += 1
                }
            }
            else { return }
        }
        
    }
    
    
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: HomeViewModel(showsAPIService: ShowsAPIService(), scheduleAPIService: ScheduleAPIService(), castAPIService: CastAPIService()))
    }
}
