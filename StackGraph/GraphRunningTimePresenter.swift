//
//  GraphRunningTimePresenter
//  StackGraph
//
//  Created by Gonzalo Gonzalez  on 29/12/17.
//  Copyright © 2017 Gonzalo Gonzalez . All rights reserved.
//

import Foundation

class GraphRunningTimePresenter {
    
    var graphRunningTimeView: GraphRunningTimeView?
    var runningTimeRepository: RunningTimeRepository?
    
    init(runningTimeRepository: RunningTimeRepository) {
        self.runningTimeRepository = runningTimeRepository
    }
    
    func attachView (view: GraphRunningTimeView) {
        graphRunningTimeView = view
    }
    
    func detachView () {
        graphRunningTimeView = nil
    }
    
    func viewDidLoad() {
    }
    
    func viewDidAppear() {
    }
    
    func viewWillAppear() {
        self.updateInterface()
    }
    
    func viewDidDisappear() {
    }
    
    func updateInterface () {
    runningTimeRepository?.retrieveTimeGraphCollection(completion: { (runningGraphDataCollection) in
            if runningGraphDataCollection != nil {
                self.graphRunningTimeView?.updateInfo(runningTimeCollection: runningGraphDataCollection!)
            }
            
        })
    }
}
