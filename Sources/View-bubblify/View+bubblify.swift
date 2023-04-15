//
//  View+bubblify.swift
//  
//
//  Created by Jeremy Bannister on 4/15/23.
//

///
@_exported import SwiftUI


///
extension View {
    
    ///
    public func bubblify
        (color: Color = .white,
         cornerRadius: CGFloat = 8)
    -> some View {
        
        ///
        self.bubblify(
            color: color,
            shape: RoundedRectangle(cornerRadius: cornerRadius)
        )
    }
    
    ///
    func bubblify
        <S: Shape>
        (color: Color = .white,
         shape: S)
    -> some View {
        
        ///
        self
            .clipShape(shape)
            .background(
                shape
                    .fill(color)
                    .shadow(radius: 2, y: 1)
            )
    }
}
