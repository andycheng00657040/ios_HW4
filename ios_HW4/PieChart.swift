//
//  PieChart.swift
//  ios_HW4
//
//  Created by User08 on 2020/5/19.
//  Copyright © 2020 00657012. All rights reserved.
//

import SwiftUI

struct PieChart: Shape
{
    var startAngle: Angle
    var endAngle: Angle
    
    func path(in rect: CGRect) -> Path
    {
        Path{(path) in
            let center = CGPoint(x: rect.midX, y: rect.midY)
            path.move(to: center)
            path.addArc(center: center, radius: rect.midX,
                startAngle: startAngle, endAngle: endAngle, clockwise: false)
        }
    }
}



