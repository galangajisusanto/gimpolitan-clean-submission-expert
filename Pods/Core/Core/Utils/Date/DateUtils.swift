//
//  DateUtils.swift
//  Core
//
//  Created by Galang Aji Susanto on 30/11/21.
//

import Foundation

public class DateUtils {
    public static let dateTextFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMMM yyyy"
        return formatter
    }()
    public static let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-mm-dd"
        return dateFormatter
    }()
}
