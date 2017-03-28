//
//  DataLoad.swift
//  PDD
//
//  Created by Дмитрий on 28.03.17.
//  Copyright © 2017 Ratnikov Dmitry. All rights reserved.
//

import Foundation

class DataLoad {
    
    func dataLoad(fileName:String)->[QuestionModel] {
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
        let result = [QuestionModel]()
        
        
        return []
        
        
    }
    
    
    
    
    
}

//for array in arrayOfdata {
//    for (key,value) in array{
//        for element in result {
//            var tranzit = element
//            guard let answer = ["v"]
//                
//                else {
//                    
//            }
//            
//        }
//}

//tranzit.answers = ["v"],
//tranzit.biletNumber = Int("biletNumber")!,
//tranzit.comment = "comment",
//tranzit.correctAnswer = Int("otvet")!,
//tranzit.quest = "quest",
//tranzit.questNumber = Int("questNumber")!
//else {
//    fatalError()
//
//
