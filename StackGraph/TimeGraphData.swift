//
//  TimeGraphData.swift
//  StackGraph
//
//  Created by Gonzalo Gonzalez  on 29/12/17.
//  Copyright © 2017 Gonzalo Gonzalez . All rights reserved.
//

import Foundation

struct TimeGraphData {
    var order: Int
    var amount: String
    var month: String
    var percentage: Double
    
    init (order: Int, amount: String, month: String, percentage: Double) {
        self.order = order
        self.amount = amount
        self.month = month
        self.percentage = percentage
    }
}
