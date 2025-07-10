//
//  DummyData.swift
//  StudentTrackerApp
//
//  Created by Dharuv Sharma on 09/07/25.
//
import Foundation
struct DummyData {
    // Static sample student data
    static let sampleStudent = Student(
        name: "Dharuv Sharma",
        studentClass: "12th Grade",
        studentID: "STU2025001",
        courses: ["Math", "Physics", "Chemistry", "English"],
        attendance: Attendance(presentDays: 22, totalDays: 30),
        upcomingTests: [
            Test(subject: "Math", date: "2025-07-15"),
            Test(subject: "Physics", date: "2025-07-20")
        ],
        previousScores: [
            Score(subject: "Math", score: 85),
            Score(subject: "Chemistry", score: 78),
            Score(subject: "English", score: 92)
        ]
    )
}
