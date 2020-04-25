//
//  File.swift
//  HomeWorkThird
//
//  Created by Магомед Абдуразаков on 02/07/2019.
//  Copyright © 2019 Магомед Абдуразаков. All rights reserved.
//


struct Question {
    
    // MARK: - Public Properties
    
    var question: String
    var type: Type
    var answers: [Answer]
    static var all: [Question] {
        return [
            Question(question: "Какой автомобиль вам больше нравится?", type: .typeForQuestionFirst, answers: [
                Answer(text: "Спортивный", type: .porshePanamera),
                Answer(text: "Сдержанный", type: .volkswagenPolo),
                Answer(text: "Оригинальный", type: .miniHatchIII),
                Answer(text: "Авангардный", type: .landCruiserPrado)
                ]),
            
            Question(question: "Какие качества вам нравятся в автомобиле?", type: .typeForQuestionSecond, answers: [
                Answer(text: "Скорость", type: .porshePanamera),
                Answer(text: "Надежность", type: .volkswagenPolo),
                Answer(text: "Компактность", type: .miniHatchIII),
                Answer(text: "Проходимость", type: .landCruiserPrado)
                ]),
            
            Question(question: "Какую сумму вы готовы потратить на автомобиль?", type: .typeForQuestionThird, answers:[
                Answer(text: "10000000", type: .porshePanamera),
                Answer(text: "1000000", type: .volkswagenPolo),
                Answer(text: "1500000", type: .miniHatchIII),
                Answer(text: "4000000", type: .landCruiserPrado)
                ])
        ]
    }
    
}
