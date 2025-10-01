//
//  DateFormatter+Extensions.swift
//  BeRealAppClone
//
//  Created by Carlos Sac on 10/1/25.
//
import Foundation

extension DateFormatter {
    static var postFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        return formatter
    }()
}
