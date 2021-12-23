//
//  View+Extensions.swift
//  LetsChat
//
//  Created by Mohammad Azam on 11/9/20.
//

import Foundation
import SwiftUI 

extension View {
    
    func embedInNavigationView() -> some View {
        NavigationView { self }
    }
    
}
