//
//  CommentShape.swift
//  Showchat
//
//  Created by Vikranth Kumar on 11/26/23.
//

import SwiftUI

struct CommentShape: Shape {
    
    static let pointerHeight: CGFloat = 16
    
    let triangleHeight: CGFloat = CommentShape.pointerHeight
    let arcRadius: CGFloat = 12
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.midX + triangleHeight, y: rect.minY + triangleHeight))
        path.addLine(to: CGPoint(x: rect.maxX - arcRadius, y: rect.minY + triangleHeight))
        path.addArc(center: CGPoint(x: rect.maxX - arcRadius, y: rect.minY + triangleHeight + arcRadius), radius: arcRadius, startAngle: .degrees(270), endAngle: .degrees(0), clockwise: false)
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY - arcRadius))
        path.addArc(center: CGPoint(x: rect.maxX - arcRadius, y: rect.maxY - arcRadius), radius: arcRadius, startAngle: .degrees(0), endAngle: .degrees(90), clockwise: false)
        path.addLine(to: CGPoint(x: rect.minX + arcRadius, y: rect.maxY))
        path.addArc(center: CGPoint(x: rect.minX + arcRadius, y: rect.maxY - arcRadius), radius: arcRadius, startAngle: .degrees(90), endAngle: .degrees(180), clockwise: false)
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY + arcRadius + triangleHeight))
        path.addArc(center: CGPoint(x: rect.minX + arcRadius, y: rect.minY + arcRadius + triangleHeight), radius: arcRadius, startAngle: .degrees(180), endAngle: .degrees(270), clockwise: false)
        path.addLine(to: CGPoint(x: rect.midX - triangleHeight, y: rect.minY + triangleHeight))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        return path
    }
}
