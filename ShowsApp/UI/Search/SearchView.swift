//
//  SearchView.swift
//  ShowsApp
//
//  Created by COBE on 17.10.2022..
//

import SwiftUI

struct SearchView: View {
    
    @ObservedObject var viewModel: SearchViewModel
    @State var search = ""
    var body: some View {
        ZStack(alignment: .leading) {
            
            SearchMoviesView(movies: viewModel.movies)
                .searchable(text: $search)
                .foregroundColor(Color("LightGray"))
        }
        .onChange(of: search) { newValue in
            if search.isEmpty {
                viewModel.emptyActorsField()
            } else {
                viewModel.loadShows(for: newValue)
            }
        }
        
        .padding(.bottom, 3)
        .padding(.top, 5)
        .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: UIScreen.main.bounds.height)
        .background(.black)
        
        
    }
    
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(viewModel: SearchViewModel(searchAPIService: searchAPIService()))
    }
}


