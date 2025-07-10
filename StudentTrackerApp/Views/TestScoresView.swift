//
//  TestScoresView.swift
//  StudentTrackerApp
//
//  Created by Dharuv Sharma on 09/07/25.
//
import SwiftUI

struct TestScoresView: View {
    let scores: [Score]

    var body: some View {
        ForEach(scores) { score in
            HStack {
                Text(score.subject)
                Spacer()
                Text("\(score.score)%")
                    .bold()
            }
            .padding(.vertical, 4) // Add padding for readability
        }
    }
}
