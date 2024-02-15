//
//  BarGraphView.swift
//  SpeakBuddyAssessment
//
//  Created by Martin Nash on 2/14/24.
//

import SwiftUI
import Charts

struct PercentHighBar<Content: View>: View {

    @Binding var percent: Double
    let content: Content

    init(percent: Binding<Double>, @ViewBuilder content: () -> Content) {
        self._percent = percent
        self.content = content()
    }

    var body: some View {
        GeometryReader { proxy in
            Color.clear
                .overlay(alignment: .bottom) {
                    content
                        .frame(height: percent * proxy.size.height)
                }
        }
    }
}

struct GraduallyAppearingGraph<Bar: View>: View {


    private var bar: Bar

    struct Entry : Identifiable, Equatable {
        var id = UUID()
        let percent: Double
        let caption: String
        var active: Bool

        var value: Double {
            get {
                active ? percent : 0
            }
            set {}
        }
    }

    class ViewModel: ObservableObject {
        
        @Published var entries: [Entry]

        init(entries: [Entry]) {
            self.entries = entries
        }

        func sendOne() {
            for (index, entry) in entries.enumerated() where !entry.active{
                var copy = entry
                copy.active.toggle()
                entries[index] = copy
                return
            }
        }
    }

    @ObservedObject private var viewModel: ViewModel
    let barWidth: CGFloat = 50
    let space: CGFloat = 26

    init(entries: [Entry], @ViewBuilder bar: () -> Bar) {
        self.viewModel = ViewModel(entries: entries)
        self.bar = bar()
    }

    var body: some View {
        VStack {
            HStack(spacing: space) {
                ForEach($viewModel.entries) { entry in
                    PercentHighBar(percent: entry.value) {
                        bar
                    }
                        .frame(width: barWidth)
                }
            }

            HStack(spacing: space) {
                ForEach(viewModel.entries) { entry in
                    Text(entry.caption)
                        .frame(width: barWidth)
                        .multilineTextAlignment(.center)
                }
            }
        }
        .onAppear {
            for index in viewModel.entries.indices {
                print(index)
                    withAnimation(.interactiveSpring(duration: 1).delay(0.3 * Double(index))) {
                        viewModel.sendOne()
                    }
            }
        }
    }
}

#Preview {
    GraduallyAppearingGraph(
        entries: [
            .init(percent: 0.1, caption: "Fun times here", active: false),
            .init(percent: 0.2, caption: "This looks nice", active: false),
            .init(percent: 0.5, caption: "1ヶ月", active: false),
            .init(percent: 0.7, caption: "D", active: false),
            .init(percent: 1.0, caption: "E", active: false),
        ], bar: {
            LinearGradient(colors: [.blue, .green], startPoint: .top, endPoint: .bottom)
                .clipShape(
                    .rect(topLeadingRadius: 3, topTrailingRadius: 3)
                )
        })
        .frame(height: 250)
        .padding()
}
