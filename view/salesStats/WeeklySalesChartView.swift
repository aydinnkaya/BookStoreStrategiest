//
//  WeeklySalesChartView.swift
//  BookStoreStrategiest
//
//  Created by Aydın KAYA on 19.03.2024.
//

import SwiftUI
import Charts

struct WeeklySalesChartView: View {
    @ObservedObject var salesViewModel: SalesViewModel
    
    var body: some View {
        Chart(salesViewModel.salesByWeek , id : \.day){ saleData in
            BarMark(
                x: .value("Week", saleData.day, unit: .weekOfYear),
                y: .value("Sales", saleData.sales))
            .foregroundStyle(Color.blue.gradient)
        }

    }

}

struct PlainWeeklySalesChartView: View {
    let salesData : [Sale]
    var body: some View {
        Chart(salesData){ sale in
             
            BarMark(
                x: .value("Week", sale.saleDate, unit: .weekOfYear),
                y: .value("Sales", sale.quantity))
            .foregroundStyle(Color.blue.gradient)
        }

    }

}

#Preview {
    WeeklySalesChartView(salesViewModel: .preview)
        .aspectRatio(1, contentMode: .fit)
        .padding()
        .background()
}
