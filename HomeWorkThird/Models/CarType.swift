//
//  CarType.swift
//  HomeWorkThird
//
//  Created by Магомед Абдуразаков on 02/07/2019.
//  Copyright © 2019 Магомед Абдуразаков. All rights reserved.
//

enum CarType {
    case porshePanamera, volkswagenPolo, miniHatchIII, landCruiserPrado
}

extension CarType {
    var definition: String {
        switch self {
        case .porshePanamera:
            return "Вам подходит быстрый автомобиль - Porshe Panamera"
        case .volkswagenPolo:
            return "Вам подходит надежный автомобиль - Volkswagen Polo"
        case .miniHatchIII:
            return "Вам подходит маневренный автомобиль - MINI Hatch III"
        case .landCruiserPrado:
            return "Вам подходит большой автомобиль - Land Cruiser Prado"
        }
    }
    
}
