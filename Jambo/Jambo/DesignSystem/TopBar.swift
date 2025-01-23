import SwiftUI

struct TopBarModifier<Left, Right>: ViewModifier where Left: View, Right: View {
    var title: String
    var titleFont: Font
    var titleColor: Color
    var backgroundColor: Color
    var padding: (Edge.Set, CGFloat?)
    var leftItem: (() -> Left)?
    var rightItem: (() -> Right)?
    var underLine: Bool
    
    func body(content: Content) -> some View {
        VStack(spacing: 0) {
            TopBar(
                title: self.title,
                titleFont: self.titleFont,
                titleColor: self.titleColor,
                backgroundColor: self.backgroundColor,
                padding: self.padding,
                leftItem: self.leftItem,
                rightItem: self.rightItem,
                underLine: self.underLine
            )
            .zIndex(999)
            content
                .frame(maxHeight: .infinity, alignment: .top)
        }
        .navigationBarBackButtonHidden()
    }
}

struct TopBar<Left, Right>: View where Left: View, Right: View {
    var title: String
    var titleFont: Font
    var titleColor: Color
    var backgroundColor: Color
    var padding: (Edge.Set, CGFloat?)
    var leftItem: (() -> Left)?
    var rightItem: (() -> Right)?
    var underLine: Bool
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                self.leftItem?()
                Spacer()
                self.rightItem?()
            }
            .overlay {
                Text(self.title)
                    .font(titleFont)
                    .foregroundColor(self.titleColor)
            }
            .padding(padding.0, padding.1)
            .padding(.top, 16)
            .padding(.bottom, 16)
            
            if underLine {
                Line()
                    .frame(height: 2)
                    .background(Color.white)
            }
        }
        .background(
            self.backgroundColor
                .ignoresSafeArea()
        )
    }
}

extension View {
    public func topBar<Left: View, Right: View>(
        title: String,
        titleFont: Font = .title,
        titleColor: Color = .white,
        backgroundColor: Color = .white,
        padding: (Edge.Set, CGFloat?) = (.horizontal, 16),
        @ViewBuilder leftItem: @escaping () -> Left,
        @ViewBuilder rightItem: @escaping () -> Right,
        underLine: Bool = false
    ) -> some View {
        modifier(
            TopBarModifier(
                title: title,
                titleFont: titleFont,
                titleColor: titleColor,
                backgroundColor: backgroundColor,
                padding: padding,
                leftItem: leftItem,
                rightItem: rightItem,
                underLine: underLine
            )
        )
    }
    
    public func searchTopBar(
        leftItemTap: @escaping () -> Void,
        rightItemTap: @escaping () -> Void
    ) -> some View {
        self.topBar(
            title: "",
            leftItem: {
                SearchTopBarLeftItem(tap: leftItemTap)
            },
            rightItem: {
                SearchTopBarRightItem(tap: rightItemTap)
            }
        )
    }
}

struct SearchTopBarLeftItem: View {
    var tap: () -> Void
    
    var body: some View {
        Button {
            tap()
        } label: {
            RoundedRectangle(cornerRadius: 17.6)
                .stroke(Color(.primary50), lineWidth: 2.0)
                .frame(height: 44)
                .overlay {
                    HStack {
                        Image(.icLogo)
                        
                        Text("Search for Cards")
                            .font(.system(size: 14))
                            .fontWeight(.regular)
                            .foregroundStyle(Color(.primary50))
                    }
                }
        }
    }
}

struct SearchTopBarRightItem: View {
    var tap: () -> Void
    
    var body: some View {
        Button {
            tap()
        } label: {
            Image(.icAlert)
        }
    }
}
