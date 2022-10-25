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
                
                MovieView(movie: viewModel.data as! ShowsAPIResponse)
                    .padding(.bottom, 3)

            }
            else  {
                ScheduleView(schedule: viewModel.data as! ScheduleAPIResponse)
                    .padding(.bottom,3)
            }
                VStack {
                    HStack {
                        Text("Cast")
                        .font(.title2)
                        .foregroundColor(Color("LightGray"))
                        Spacer()
                        Text("show all")
                            .foregroundColor(Color("PrimaryYellow"))
                            .font(.subheadline)
                            .fontWeight(.bold)
                    }
                }
            }
            .frame(width: geo.size.width, height: geo.size.height * 0.65)
                
            
            }
         
            
            
    }
        .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        .background(.black)
        
}

/*struct DetailView_Previews: PreviewProvider {
    
   
    static var previews: some View {
        DetailView()
    }
}
 */


}
