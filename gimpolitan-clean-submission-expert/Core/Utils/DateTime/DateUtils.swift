//
//  DateUtils.swift
//  gimpolitan-clean-submission-expert
//
//  Created by Galang Aji Susanto on 07/11/21.
//

import Foundation

class DateUtils {
    static let dateTextFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMMM yyyy"
        return formatter
    }()
    static let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-mm-dd"
        return dateFormatter
    }()
}
