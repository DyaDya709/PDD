//
//  PddViewController.swift
//  PDD
//
//  Created by Дмитрий on 28.03.17.
//  Copyright © 2017 Ratnikov Dmitry. All rights reserved.
//

import UIKit

class PddViewController: UIViewController, UITableViewDataSource {
    
    var questionModel = QuestionModel()
    @IBOutlet var realUrlImageView: UIImageView!
    
    @IBOutlet var question: UILabel!
    
    @IBOutlet var comment: UILabel!
    
    @IBOutlet var tableView: UITableView!
  
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        let tranzit =  DataLoad.dataLoad(fileName: "b2")
        for element in tranzit {
            self.question.text = element.quest
            self.comment.text = element.comment
            self.title = String(element.biletNumber!)
            questionModel.answers = element.answers
            realUrlImageView.image = element.image
        }
        
    }
    
    // Do any additional setup after loading the view.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)-> Int {
        return (questionModel.answers?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for:indexPath)
        cell.textLabel?.text = questionModel.answers?[indexPath.row]
        
        return cell
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
