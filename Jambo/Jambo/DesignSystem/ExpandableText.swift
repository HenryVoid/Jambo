//
//  ExpandableText.swift
//  Jambo
//
//  Created by 송형욱 on 1/23/25.
//

import SwiftUI

struct ExpandableText: View {
    private var text: String = ""
    private var lineLimit: Int = 1

    @State private var isTruncated: Bool? = nil
    @State private var isExpended: Bool = false

    init(text: String, lineLimit: Int) {
        self.text = text
        self.lineLimit = lineLimit
    }

    private func calculateTruncation() -> some View {
        ViewThatFits(in: .vertical) {
            Text(text)
                .font(.system(size: 13))
                .fontWeight(.regular)
                .hidden()
                .onAppear {
                    guard isTruncated == nil else { return }
                    isTruncated = false
                }

            Color.clear
                .hidden()
                .onAppear {
                    guard isTruncated == nil else { return }
                    isTruncated = true
                }
        }
    }

    var body: some View {
        Text(text)
            .font(.system(size: 13))
            .fontWeight(.regular)
            .lineLimit(isExpended ? nil : lineLimit)
            .background(calculateTruncation())
            .overlay(alignment: .bottomTrailing) {
                if isTruncated == true && !isExpended {
                    Text(" ..View More")
                        .font(.system(size: 13))
                        .fontWeight(.bold)
                        .foregroundStyle(.textDefault)
                        .underline()
                        .onTapGesture {
                            withAnimation {
                                self.isExpended.toggle()
                            }
                        }
                        .background {
                            RoundedRectangle(cornerRadius: 8)
                                .fill(
                                    LinearGradient(gradient: Gradient(colors: [Color(white: 1, opacity: 0.8), .white]), startPoint: .leading, endPoint: .trailing)
                                )
                        }
                }


            }
    }
}
