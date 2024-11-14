//
//  HeaderView.swift
//  To-do
//
//  Created by Yashasvi Pamu on 11/10/24.
//

import SwiftUI

struct HeaderView: View {
    let title: String
    let subtitle: String
    let color1: Color
    let color2: Color
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(color1).opacity(0.6)
                .rotation3DEffect(Angle(degrees: 160), axis: (x: 20, y: 0, z: 50))
            
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(color2).opacity(0.6)
                .rotation3DEffect(Angle(degrees: 30), axis: (x: -18, y: 10, z: 30))
            
            VStack {
                Text(title)
                    .font(.system(size: 50))
                    .foregroundColor(Color.white)
                    .fontWeight(.bold)
                
                Text(subtitle)
            }
        }
        .frame(width: UIScreen.main.bounds.width * 3, height: 550)
        .offset(y: -250)
    }
}

#Preview {
    HeaderView(title: "To Do List", subtitle: "Get Things Done!", color1: .primary, color2: .blue)
}
