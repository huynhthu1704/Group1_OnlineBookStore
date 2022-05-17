//
//  AdminHomeScreenViewController.swift
//  Group1_OnlineBookStore
//
//  Created by Huynh Thu on 2022-05-17.
//  Copyright © 2022 Huynh Thu. All rights reserved.
//
import Charts
import UIKit

class AdminHomeScreenViewController: UIViewController, ChartViewDelegate {

    var barChart = BarChartView()
    override func viewDidLoad() {
        super.viewDidLoad()
        barChart.delegate = self
    }


    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        barChart.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        barChart.center = view.center
        view.addSubview(barChart)
        let set = BarChartDataSet(entries : [BarChartDataEntry(x: 1, y: 1),
        BarChartDataEntry(x: 1, y: 1),
        BarChartDataEntry(x: 1, y: 1),
        BarChartDataEntry(x: 1, y: 1)])
        set.colors = ChartColorTemplates.joyful()
        let data = BarChartData(dataSet: set)
        barChart.data = data
    }

}
