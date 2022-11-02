//
//  DetailView.swift
//  ShowsApp
//
//  Created by COBE on 20.10.2022..
//

import SwiftUI

struct DetailView<T>: View {
    
    @ObservedObject var viewModel: DetailsViewModel<T>
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                VStack {
                    if ((viewModel.data as? ShowsAPIResponse) != nil) {
                        
                        MovieView<T>(movie: viewModel.data as! ShowsAPIResponse, cast: viewModel.cast, viewModel: viewModel)
                    }
                    else  {
                        ScheduleView<T>(schedule: viewModel.data as! ScheduleAPIResponse, cast: viewModel.cast,viewModel: viewModel)
                        
                    }
                }
                .frame(width: geo.size.width, height: geo.size.height * 0.73)
            }
            
        }
        
        
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
    }
}

/*struct DetailView_Previews: PreviewProvider {
 
 
 static var previews: some View {
 DetailView()
 }
 }
 */



