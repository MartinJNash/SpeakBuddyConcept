//
//  SwiftChartsBarGraph.swift
//  SpeakBuddyAssessment
//
//  Created by Martin Nash on 2/14/24.
//

import SwiftUI
import Charts

/*
 Implementation of animated graph using Swift Charts framework. One pain point is that annotations are not counted in the layout system.
 */
struct SwiftChartsBarGraphView: View {

    class SwiftChartsBarGraphViewModel: ObservableObject {

        @Published var contents: [Content] = [
            Content(label: "A somewhat long text", value: 66, active: false),
            Content(label: "Not included in the layout! Why?", value: 100, active: false),
            Content(label: "Why again?", value: 220, active: false),
            Content(label: "Short", value: 300, active: false),
        ]

        func addNext() {
            if let index = contents.firstIndex(where: { !$0.active }) {
                contents[index].active.toggle()
            }
        }

        struct Content: Identifiable {
            let id = UUID()
            let label: String
            let value: Int
            var active: Bool

            var realizedValue: Int {
                active ? value : 0
            }
        }
    }

    @StateObject private var viewModel = SwiftChartsBarGraphViewModel()

    var body: some View {
        Chart {
            ForEach(viewModel.contents) { item in
                BarMark(
                    x: .value("X", item.label),
                    y: .value("Y", item.realizedValue),
                    width: .fixed(70)
                )
                .cornerRadius(3)
                .annotation(position: .bottom, alignment: .center) {
                    Text(item.label)
                        .frame(width: 70)
                        .multilineTextAlignment(.center)
                        .bold()
                        .zIndex(.infinity)

                }
            }
        }
        .foregroundStyle(LinearGradient(colors: [.blue, .green], startPoint: .top, endPoint: .bottom))
        .chartXAxis(.hidden)
        .chartYAxis(.hidden)
        .chartOverlay(content: { px in
            Color.green.opacity(0.3)
        })
        .chartYScale(domain: [0, 400])
        .onAppear {
            for index in 0..<viewModel.contents.count {
                withAnimation(.spring(duration: 0.7).delay(0.2 * Double(index))) {
                    viewModel.addNext()
                }
            }
        }
    }
}


// This preview demonstrates that annotations are not part of the layout.
#Preview {
    VStack(spacing: 0, content: {
        Color.red
            .frame(width: 100, height: 100)
        SwiftChartsBarGraphView()
            .frame(height: 250)
        Color.red
            .frame(width: 100, height: 100)
    })
}
