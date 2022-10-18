//
//  SearchView.swift
//  ShowsApp
//
//  Created by COBE on 17.10.2022..
//

import SwiftUI

struct SearchView: View {
    
    @ObservedObject var viewModel: SearchViewModel
    
    var body: some View {
        
        Text("This is a search view")
        
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(viewModel: SearchViewModel())
    }
}
