//
//  View+bubblify.swift
//  
//
//  Created by Jeremy Bannister on 4/15/23.
//

extension View {
    public func bubblify(
        color explicitColor: Color? = nil,
        cornerRadius: CGFloat = 8
    ) -> some View {
        
        self.bubblify(
            color: explicitColor,
            shape: RoundedRectangle(cornerRadius: cornerRadius)
        )
    }
    
    public func bubblify(
        content explicitContent: some ShapeStyle,
        cornerRadius: CGFloat = 8
    ) -> some View {
        
        self.bubblify(
            content: explicitContent,
            shape: RoundedRectangle(cornerRadius: cornerRadius)
        )
    }
    
    public func bubblify<S: Shape>(
        color explicitColor: Color? = nil,
        shape: S
    ) -> some View {
        
        ColorSchemeAppropriateBackroundColor { colorSchemeAppropriateBackgroundColor in
            self.bubblify(
                content: explicitColor ?? colorSchemeAppropriateBackgroundColor,
                shape: shape
            )
        }
    }
    
    public func bubblify<
        S: Shape,
        Content: ShapeStyle
    >(
        content explicitContent: Content,
        shape: S
    ) -> some View {
        
        self
            .clipShape(shape)
            .background(
                shape
                    .fill(explicitContent)
                    .shadow(radius: 2, y: 1)
            )
    }
}

private struct ColorSchemeAppropriateBackroundColor<Body: View>: View {
    
    @Environment(\.colorScheme)
    private var colorScheme: ColorScheme
    
    init(generateBody: @escaping (Color)->Body) {
        self.generateBody = generateBody
    }
    
    let generateBody: (Color)->Body
    
    var body: some View {
        generateBody(color)
    }
    
    private var color: Color {
        switch colorScheme {
        case .light: return .white
        case .dark: return .charcoal
        @unknown default: return .white
        }
    }
}

private extension Color {
    static var charcoal: Self { .init(white: 0.1) }
}
