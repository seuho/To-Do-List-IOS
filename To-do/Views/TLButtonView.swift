//
//  TLButtonView.swift
//  To-do
//
//  Created by Yashasvi Pamu on 11/10/24.
//

import SwiftUI

struct TLButtonView: View {
    let buttonName: String
    let buttonColor: Color
    let action: () -> Void
    
    var body: some View {
        Button{
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(buttonColor)
                
                Text(buttonName)
                    .foregroundColor(Color.white)
                    .fontWeight(.bold)
            }
        }.frame(height: 40)
    }
}

#Preview {
    TLButtonView(buttonName: "Log In", buttonColor: .blue){}
}
