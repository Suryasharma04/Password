//
//  SuccessView.swift
//  Password
//
//  Created by Surya Sharma on 9/14/23.
//

import SwiftUI

struct SuccessView: View {
    var body: some View {
        ZStack{
            Image("imageTwo")
                .opacity(0.5)
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                Text("SUCCESS")
                    .font(.system(size: 32))
                    .foregroundColor(.green)
                    .fontWeight(.bold)
                
                Text("You logged in!")
                    .font(.system(size: 32))
                    .foregroundColor(.black)
                    .fontWeight(.light)
            }
        }
        
        
    }
}

struct SuccessView_Previews: PreviewProvider {
    static var previews: some View {
        SuccessView()
    }
}
