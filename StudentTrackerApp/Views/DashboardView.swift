//
//  DashboardView.swift
//  StudentTrackerApp
//
//  Created by Dharuv Sharma on 09/07/25.
//

import SwiftUI
import SwiftUICharts

struct DashboardView: View {
    let student = DummyData.sampleStudent // Dummy student data for UI display

    var body: some View {
        List {
            // Display student's credentials
            Section(header: Text("Student Info")) {
                VStack(alignment: .leading, spacing: 8) {
                    Text(student.name)
                        .font(.title3.bold())
                    Label("Class: \(student.studentClass)", systemImage: "graduationcap")
                    Label("ID: \(student.studentID)", systemImage: "person")
                    Label("Courses: \(student.courses.count)", systemImage: "book")
                }
            }

            // Chart section for attendance stats
            Section(header: Text("Attendance")) {
                AttendanceChartView(presentDays: student.attendance.presentDays, totalDays: student.attendance.totalDays)
            }

            // Test score section
            Section(header: Text("Test Scores")) {
                TestScoresView(scores: student.previousScores)
            }

            // Upcoming test list
            Section(header: Text("Upcoming Tests")) {
                ForEach(student.upcomingTests) { test in
                    Label("\(test.subject) on \(test.date)", systemImage: "calendar")
                }
            }
        }
        .listStyle(.insetGrouped) // Use grouped list style for HIG compliance
        .navigationTitle("Dashboard")
    }
}
