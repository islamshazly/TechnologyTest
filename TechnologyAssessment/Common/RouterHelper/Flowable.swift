//
//  Flowable.swift
//  TechnologyAssessment
//
//  Created by Islam Elshazly on 16/05/2023.
//

protocol Flowable {

    associatedtype Route

    var horizontalFlow: HorizontalFlowType { get }
    var verticalFlow: VerticalFlowType { get }

    func handle(_ route: Route)
}
