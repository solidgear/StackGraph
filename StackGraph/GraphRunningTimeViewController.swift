//
//  GraphHoursViewController.swift
//  StackGraph
//
//  Created by Gonzalo Gonzalez  on 29/12/17.
//  Copyright © 2017 Gonzalo Gonzalez . All rights reserved.
//

import UIKit

class GraphRunningTimeViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var graphStackView: UIStackView!
    @IBOutlet weak var indexStackView: UIStackView!
    
    let graphColor: UIColor = UIColor(red: 51/255, green: 196/255, blue: 255/255, alpha: 1.0)
    
    var presenter: GraphRunningTimePresenter!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.presenter = GraphRunningTimePresenter(runningTimeRepository: RunningTimeRepository.instance)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.attachView(view: self)
        presenter.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.viewWillAppear()
    }
    
    //MARK: Graph Support
    
    func removeGraphElements () {
        removeIndexElements()
        removeAllGraphElements()
    }
    
    func newGraphElement (timeGraphData: TimeGraphData) {
        addIndexElement(timeGraphData: timeGraphData)
        addGraphElement(timeGraphData: timeGraphData)
    }
    
    private func removeIndexElements () {
        for view in indexStackView.arrangedSubviews {
            view.removeFromSuperview()
        }
    }
    
    private func removeAllGraphElements () {
        for view in graphStackView.arrangedSubviews {
            view.removeFromSuperview()
        }
    }
    
    private func addIndexElement (timeGraphData: TimeGraphData) {
        let monthLabelHeight: CGFloat = 13.0
        
        let monthLabel = UILabel()
        monthLabel.text = timeGraphData.month
        monthLabel.font = UIFont.systemFont(ofSize: monthLabelHeight)
        monthLabel.textAlignment = .center
       
        monthLabel.heightAnchor.constraint(equalToConstant: monthLabelHeight).isActive = true
        
        indexStackView.addArrangedSubview(monthLabel)
        indexStackView.translatesAutoresizingMaskIntoConstraints = false;
    }
    
    private func addGraphElement (timeGraphData: TimeGraphData) {

        let amountLabelFontSize: CGFloat = 9.0
        let amountLabelPadding: CGFloat = 15.0
        let height = heightPixelsDependOfPercentage(percentage: timeGraphData.percentage)
        let totalHeight = height + amountLabelPadding
        
        let verticalStackView: UIStackView = UIStackView()
        verticalStackView.axis = .vertical
        verticalStackView.alignment = .fill
        verticalStackView.distribution = .fill
        verticalStackView.spacing = 8.0
        
        let amountLabel = UILabel()
        amountLabel.text = timeGraphData.amount
        amountLabel.font = UIFont.systemFont(ofSize: amountLabelFontSize)
        amountLabel.textAlignment = .center
        amountLabel.textColor = UIColor.darkText
        amountLabel.adjustsFontSizeToFitWidth = true
        amountLabel.heightAnchor.constraint(equalToConstant: amountLabelFontSize).isActive = true
        
        let view = UIView()
        view.backgroundColor = graphColor
        view.heightAnchor.constraint(equalToConstant: height).isActive = true
        
        verticalStackView.addArrangedSubview(amountLabel)
        verticalStackView.addArrangedSubview(view)
        
        verticalStackView.heightAnchor.constraint(equalToConstant: totalHeight).isActive = true
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false;
        
        graphStackView.addArrangedSubview(verticalStackView)
        graphStackView.translatesAutoresizingMaskIntoConstraints = false;
    }
    
    private func heightPixelsDependOfPercentage (percentage: Double) -> CGFloat {
        let maxHeigh: CGFloat = 90.0
        return (CGFloat(percentage) * maxHeigh) / 100
    }
}

extension GraphRunningTimeViewController : GraphRunningTimeView {
    
    func updateInfo (runningTimeCollection: [TimeGraphData]){
        removeAllGraphElements()
        for timeGraphData in runningTimeCollection {
            newGraphElement(timeGraphData: timeGraphData)
        }
    }
}
