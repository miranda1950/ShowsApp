//
//  FavoritesView.swift
//  ShowsApp
//
//  Created by COBE on 18.10.2022..
//

import SwiftUI

struct FavoritesView: View {
    @ObservedObject var viewModel: FavoritesViewModel
    
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 5) {
            ForEach(viewModel.favoriteMovies, id: \.id) { favorite in
                FavoriteCard(favorite: favorite)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                   
            }
            
        }
        }
            .padding(.bottom, 5)
        
        .background(.black)
        .onAppear {
            viewModel.loadFavoriteMovies()

        }
        
       
        .navigationBarHidden(true)
    }
}
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView(viewModel: .init(persistanceService: PersistanceService()))
    }
}
