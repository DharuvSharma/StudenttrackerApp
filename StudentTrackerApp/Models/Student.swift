//
//  Student.swift
//  StudentTrackerApp
//
//  Created by Dharuv Sharma on 09/07/25.
//
import Foundation
struct Student {
    let name: String
    let studentClass: String
    let studentID: String
    let courses: [String]
    let attendance: Attendance
    let upcomingTests: [Test]
    let previousScores: [Score]
}
