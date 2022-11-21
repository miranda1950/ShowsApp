//
//  SearchMoviesView.swift
//  ShowsApp
//
//  Created by COBE on 26.10.2022..
//

import SwiftUI

struct SearchMoviesView: View {
    
    var movies: [SearchAPIResponse]
    @ObservedObject var viewModel: SearchViewModel<Any>
    
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 3) {
                ForEach(movies, id: \.show?.id) { movie in
                    HStack {
                        AsyncImage(url: movie.show?.image?.medium)
                        {
                            image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .scaledToFit()
                            
                            
                        } placeholder: {
                            ProgressView()
                                .progressViewStyle(.circular)
                        }
                        VStack(alignment: .leading, spacing: 2) {
                            Text(movie.show?.name ?? "N/A")
                                .foregroundColor(Color("LightGray"))
                            Text(movie.show?.yearDate ?? "n")
                                .foregroundColor(Color("LightGray"))
                            
                        }
                    }
                    
                    .onTapGesture{
                        viewModel.getActors(viewModel.createShowData(movie).id)
                        viewModel.onGoToDetails?(viewModel.createShowData(movie), viewModel.actors)
                        
                    }
                    .frame(height: 100)
                    .padding(.bottom, 3)
                }
                
            }
        }
    }
}

//struct SearchMoviesView_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchMoviesView(movies: [SearchAPIResponse](), viewModel: SearchViewModel<T>)
//    }
//}

