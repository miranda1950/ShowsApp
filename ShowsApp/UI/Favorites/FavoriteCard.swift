//
//  FavoriteCard.swift
//  ShowsApp
//
//  Created by COBE on 31.10.2022..
//

import SwiftUI

struct FavoriteCard: View {
    
   
    @ObservedObject var viewModel = FavoritesViewModel(persistanceService: PersistanceService())
    var favorite: MovieData.MovieItem
    
    
    var body: some View {
        ZStack(alignment: .topLeading) {
        AsyncImage(url: favorite.imageMovie)
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
                   viewModel.removeFavorite(favorite)
                    viewModel.favoriteChecked(viewModel.showFavs)
                }
            
                Image(systemName:"heart.fill" )
                    .foregroundColor(viewModel.contains(favorite) ? Color("PrimaryYellow") : Color("LightGray"))
            
        }
        }
        
    
        
    }
}

