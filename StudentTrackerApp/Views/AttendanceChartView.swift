//
//  AttendanceChartView.swift
//  StudentTrackerApp
//
//  Created by Dharuv Sharma on 09/07/25.
//

import SwiftUI
import SwiftUICharts

struct AttendanceChartView: View {
    let presentDays: Int
    let totalDays: Int

    var body: some View {
        VStack(alignment: .leading) {
            Text("Attendance Overview")
                .font(.headline)

            // Bar chart using third-party SwiftUICharts
            BarChartView(
                data: ChartData(values: [
                    ("Present", Double(presentDays)),
                    ("Absent", Double(totalDays - presentDays))
                ]),
                title: "",
                style: Styles.barChartStyleNeonBlueLight,
                form: ChartForm.medium
            )
            .frame(height: 200)
        }
    }
}
