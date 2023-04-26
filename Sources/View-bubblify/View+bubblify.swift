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
        (color explicitColor: Color? = nil,
         cornerRadius: CGFloat = 8)
    -> some View {
        
        ///
        self.bubblify(
            color: explicitColor,
            shape: RoundedRectangle(cornerRadius: cornerRadius)
        )
    }
    
    ///
    public func bubblify
        <S: Shape>
        (color explicitColor: Color? = nil,
         shape: S)
    -> some View {
        
        ///
        ColorSchemeAppropriateBackroundColor { colorSchemeAppropriateBackgroundColor in
            self
                .clipShape(shape)
                .background(
                    shape
                        .fill(explicitColor ?? colorSchemeAppropriateBackgroundColor)
                        .shadow(radius: 2, y: 1)
                )
        }
    }
}

///
fileprivate struct ColorSchemeAppropriateBackroundColor <Body: View>: View {
    
    ///
    @Environment(\.colorScheme)
    private var colorScheme: ColorScheme
    
    ///
    init (generateBody: @escaping (Color)->Body) {
        self.generateBody = generateBody
    }
    
    ///
    let generateBody: (Color)->Body
    
    ///
    var body: some View {
        generateBody(color)
    }
    
    ///
    private var color: Color {
        switch colorScheme {
        case .light: return .white
        case .dark: return .charcoal
        @unknown default: return .white
        }
    }
}

///
fileprivate extension Color {
    
    ///
    static var charcoal: Self { .init(white: 0.1) }
}
