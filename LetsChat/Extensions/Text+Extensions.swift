//
//  Text+Extensions.swift
//  LetsChat
//
//  Created by Mohammad Azam on 11/10/20.
//

import Foundation
import SwiftUI

extension Text {
    
    func withPrimaryTextStyle() -> some View {
        return self
        .padding(10)
        .foregroundColor(Color.white)
        .background(Color(#colorLiteral(red: 0.184266597, green: 0.8003296256, blue: 0.4435204864, alpha: 1)))
        .clipShape(RoundedRectangle(cornerRadius: 10, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/))
    }
    
    func withSecondaryTextStyle() -> some View {
        return self
            .padding(10)
        .foregroundColor(Color.black)
        .background(Color(#colorLiteral(red: 0.9607525468, green: 0.9647365212, blue: 0.9802598357, alpha: 1)))
        .clipShape(RoundedRectangle(cornerRadius: 10, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/))
    }
    
}
