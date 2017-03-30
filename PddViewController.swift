//
//  PddViewController.swift
//  PDD
//
//  Created by Дмитрий on 28.03.17.
//  Copyright © 2017 Ratnikov Dmitry. All rights reserved.
//

import UIKit

class PddViewController: UIViewController {
    var questionModel = QuestionModel()
    @IBOutlet var realUrlImageView: UIImageView!
    
    @IBOutlet var question: UILabel!
    
    @IBOutlet var comment: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tranzit =  DataLoad.dataLoad(fileName: "b2")
        for element in tranzit {
            self.question.text = element.quest
        self.comment.text = element.comment
        self.title = String(element.biletNumber!)
        
        }
        // Do any additional setup after loading the view.
    }
    
    
}
//private func loadData() {
//    // создали объект, который загрузит данные
//    let loader = DataLoader()
//    let result = loader.loadData(fileName: biletNum)
//    // вывели результат в консоль
//    //        print (result)
//
//
//    self.title = "Номер билета:\(biletNum), номер вопроса:\(currentQuestionIndex + 1)" // у viewController есть свойство title
//    self.questionList = result
//
//
//}
