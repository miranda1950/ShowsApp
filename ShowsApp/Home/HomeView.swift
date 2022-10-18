//
//  HomeView.swift
//  ShowsApp
//
//  Created by COBE on 17.10.2022..
//

import SwiftUI
import UIKit


struct HomeView: View {
    
    @ObservedObject var viewModel = HomeViewModel()
    
    var body: some View {

        
        VStack {
            HStack {
            Text("Shows")
                .foregroundColor(.gray)
                .font(.title)
                .fontWeight(.bold)
                .padding()
            Spacer()
              Text("show all")
                    .foregroundColor(Color("PrimaryYellow"))
                    .font(.subheadline)
                    .fontWeight(.bold)
            }
            
            Spacer()
            
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
        
}
    
        
}
    

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: HomeViewModel())
    }
}
