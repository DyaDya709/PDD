//
//  Pdd.swift
//  PDD
//
//  Created by Дмитрий on 28.03.17.
//  Copyright © 2017 Ratnikov Dmitry. All rights reserved.
//


import UIKit

struct QuestionModel {
    
    //{"biletNumber":1,"questNumber":3,"quest":"Этот дорожный знак указывает:","v":["Расстояние до конца тоннеля.","Расстояние до места аварийной остановки.","Направление движения к аварийному выходу и расстояние до него.",null,null],"otvet":3,"realUrl":"http://i.imgur.com/DN8giQj.jpg","comments":"Информационный знак \u003cimg class\u003d\u0027img-znak-comment\u0027 src\u003d\u0027/pdd/img/z6.21.1.png\u0027 /\u003e «Направление движения к аварийному выходу» указывает направление к аварийному выходу и расстояние до него."}//
    
    var biletNumber:Int?
    var questNumber:Int?
    var quest:String?
    var answers:[String]?
    var correctAnswer:Int?
    var comment:String?
    var realUrl:String?
    var image:UIImage?{
        //]проверяем соотвествует ли в realUrl тип данных соотвествующий типу данных URL
        let url = URL(string: realUrl!)
        //проверяем можно ли получить биты и байты сырой информации по url
        guard let data = try? Data(contentsOf: url!) else {
            return nil
        }
        return UIImage(data: data)
    }
    
   
}















