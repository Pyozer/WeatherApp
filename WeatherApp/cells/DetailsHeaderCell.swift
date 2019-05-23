//
//  DetailsHeaderCell.swift
//  WeatherApp
//
//  Created by Jean-Charles Moussé on 22/05/2019.
//  Copyright © 2019 Jean-Charles Moussé. All rights reserved.
//

import UIKit
import Charts

class DetailsHeaderCell : UITableViewCell {
    
    @IBOutlet weak var headerCity: UILabel!
    @IBOutlet weak var headerImage: UIImageView!
    @IBOutlet weak var headerTemp: UILabel!
    @IBOutlet weak var headerWeather: UILabel!
    @IBOutlet weak var chartView: LineChartView!
    @IBOutlet weak var chartControl: UISegmentedControl!
    
    func setData(_ forecast: Forecast, _ city: String) {
        headerCity.text = city
        if let _icon = forecast.currently?.icon {
            headerImage.image = UIImage(named: _icon.rawValue)
        }
        if let _temp = forecast.currently?.temperature {
            headerTemp.text = "\(_temp)°C"
        }
        headerWeather.text = forecast.currently?.summary
        
        var temperaturesEntries = [ChartDataEntry]()
        var humidityEntries = [ChartDataEntry]()
        
        var xAxisStrings: [String] = []
        
        let calendar = Calendar.current
        for (index, forecastValue) in (forecast.hourly?.data ?? []).enumerated() {
            if let _temperature = forecastValue.temperature {
                let value = ChartDataEntry(x: Double(index), y: Double(_temperature))
                temperaturesEntries.append(value)
                
                if let _humidity = forecastValue.humidity, let _maxTemp = forecast.daily?.data[0].temperatureMax {
                    let value = ChartDataEntry(x: Double(index), y: _humidity * _maxTemp)
                    humidityEntries.append(value)
                }
                
                xAxisStrings.append(index != 0 ? "\(calendar.component(.hour, from: forecastValue.time))h" : "")
            }
        }
        
        let line1 = LineChartDataSet(entries: temperaturesEntries, label: "Temperature")
        applyParamsLineChart(line1, #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1), #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1), TempratureValueFormatter())
        
        let line2 = LineChartDataSet(entries: humidityEntries, label: "Humidity")
        applyParamsLineChart(line2, #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1), #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1), HumidityValueFormatter())
        line2.visible = false
        
        initChartView(data: LineChartData(dataSets: [line1, line2]), xAxisLabels: xAxisStrings)
    }
    
    private func applyParamsLineChart(_ line: LineChartDataSet, _ color: UIColor, _ fillColor: UIColor, _ formatter: IValueFormatter) {
        line.colors = [color]
        line.fillColor = fillColor
        line.valueFormatter = formatter
        line.drawFilledEnabled = true
        line.drawCirclesEnabled = false
        line.valueFont = UIFont(name: "Helvetica Neue", size: 9.0)!
        line.mode = .cubicBezier
    }
    
    private func initChartView(data: LineChartData, xAxisLabels: [String]) {
        chartView.data = data
        // Set x-axis parameters
        chartView.xAxis.valueFormatter = IndexAxisValueFormatter(values: xAxisLabels)
        chartView.xAxis.labelPosition = .bottom
        chartView.xAxis.drawGridLinesEnabled = false
        // Set y-axis parameters
        chartView.leftAxis.enabled = false
        chartView.leftAxis.axisMinimum = 0.0
        chartView.rightAxis.enabled = false
        // Set chart parameters
        chartView.legend.enabled = false
        chartView.doubleTapToZoomEnabled = false
        chartView.pinchZoomEnabled = false
        chartView.extraTopOffset = 10
        chartView.extraBottomOffset = 10
        chartView.minOffset = 0
        chartView.animate(xAxisDuration: 0.0, yAxisDuration: 1.0)
    }
    
    @IBAction func onChartSwitch(_ sender: Any) {
        let isTemp = chartControl.selectedSegmentIndex == 0
        chartView.data?.getDataSetByIndex(0)?.visible = isTemp
        chartView.data?.getDataSetByIndex(1)?.visible = !isTemp
        chartView.notifyDataSetChanged()
    }
    
}

class TempratureValueFormatter : IValueFormatter {
    func stringForValue(
        _ value: Double,
        entry: ChartDataEntry,
        dataSetIndex: Int,
        viewPortHandler methodviewPortHandler: ViewPortHandler?
        ) -> String {
        return Int(entry.x) % 2 == 0 && entry.x != 0.0 ? "\(entry.y.toRoundString())°C" : ""
    }
}

class HumidityValueFormatter : IValueFormatter {
    func stringForValue(
        _ value: Double,
        entry: ChartDataEntry,
        dataSetIndex: Int,
        viewPortHandler methodviewPortHandler: ViewPortHandler?
        ) -> String {
        return Int(entry.x) % 2 == 0 && entry.x != 0.0 ? "\(entry.y.toRoundString())%" : ""
    }
}
