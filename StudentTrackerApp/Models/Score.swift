//
//  Score.swift
//  StudentTrackerApp
//
//  Created by Dharuv Sharma on 09/07/25.
//
import Foundation
struct Score: Identifiable {
    let id = UUID()
    let subject: String
    let score: Int
}

