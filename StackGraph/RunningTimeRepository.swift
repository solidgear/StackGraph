//
//  RunningTimeRepository.swift
//  StackGraph
//
//  Created by Gonzalo Gonzalez  on 29/12/17.
//  Copyright © 2017 Gonzalo Gonzalez . All rights reserved.
//

import Foundation

class RunningTimeRepository {
    
    static let instance = RunningTimeRepository()
    
    var timeGraphCollection: [TimeGraphData]?
    
    func retrieveTimeGraphCollection (completion: @escaping ([TimeGraphData]?) -> ()) {
        
        if timeGraphCollection != nil {
            completion(timeGraphCollection)
        } else {
            timeGraphCollection = self.createTimeCollection()
            completion(timeGraphCollection)
        }
    }
    
    private func createTimeCollection () -> [TimeGraphData] {
        
        let january = TimeGraphData.init(order: 0, amount: "15h 30'", month: "JAN", percentage: 76.0)
        let febraury = TimeGraphData.init(order: 1, amount: "10h", month: "FEB", percentage: 50.0)
        let march = TimeGraphData.init(order: 2, amount: "5h 45'", month: "MAR", percentage: 25.6)
        let april = TimeGraphData.init(order: 3, amount: "15h 25'", month: "APR", percentage: 75.7)
        let may = TimeGraphData.init(order: 3, amount: "10h 50'", month: "MAY", percentage: 51.0)
        let june = TimeGraphData.init(order: 3, amount: "20h", month: "JUN", percentage: 100.0)
        
        return [january,febraury,march,april,may,june]
    }
}
