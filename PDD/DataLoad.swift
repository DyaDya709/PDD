//
//  DataLoad.swift
//  PDD
//
//  Created by Дмитрий on 28.03.17.
//  Copyright © 2017 Ratnikov Dmitry. All rights reserved.
//

import Foundation

class DataLoad {
    
    static func dataLoad(fileName:String)->[QuestionModel] {
        // найдем путь к искомому файлу
        let pathToFile = Bundle.main.path(forResource: fileName, ofType: "json")!
        
        // Это печать пути к файлу внутри приложения
        print (pathToFile)
        
        // прочитаем поток байт из найденного пути
        //как работает try что он берет и куда кладет и чего возвращает и в каком случае надо его применять
        //и когда он должен быть опциональным или принудительным
        let data = try! Data(contentsOf:URL(fileURLWithPath: pathToFile))
        
        // объект типа Any, который почти готов к использованию
        let json = try! JSONSerialization.jsonObject(with: data, options:[])
        //Надо выяснить как проверять формат данных(типа что это такое - массив массивов словарей или просто массив словарей
        guard let arrayOfdata = json as? [[String:Any]] else {
            fatalError("не форматит сегодня")
        }
        //почему криво инициализируется( через массив)
        //!!!!!!Пока не понятно что нам нужно на выходе, то ли массив билетов, то ли просто билет, поэтому строку коментим, временно!!!!!!!!!
        var result = [QuestionModel]()
        var tranzit = QuestionModel()
        for array in arrayOfdata {
            let biletNumber = array["biletNumber"] as? Int ?? nil
            let questNumber = array["questNumber"] as? Int ?? nil
            let quest = array["quest"] as? String ?? nil
            var answers = [String]()
            
                if let value = array["v"] as? [Any]  {
                    for element in value {
                        if let x = element as? String {
                            
                            answers.append(x)
                            
                        }
                        
                    }
                }
            
            
            let correctAnswer = array["otvet"] as? Int ?? nil
            let comment = array["comments"] as? String ?? nil
            let realUrl = array["realUrl"] as? String ?? nil
            
            tranzit.biletNumber = biletNumber
            tranzit.questNumber = questNumber
            tranzit.quest = quest
            tranzit.answers = answers
            tranzit.correctAnswer = correctAnswer
            tranzit.comment = comment
            tranzit.realUrl = realUrl
            result.append(tranzit)
        }
        return result
        
    }
    
    
}











