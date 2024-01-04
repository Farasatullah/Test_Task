//
//  DetailVC.swift
//  Test_Task
//
//  Created by Farasat_Niazi on 04/01/2024.
//

import UIKit

class DetailVC: UIViewController,newsSelectionDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        MasterVC.delegate = self

        // Do any additional setup after loading the view.
    }

}
extension DetailVC {
    func newsSelected(selectedNews: News){
        debugPrint("Displaying News data : \(selectedNews.byline) ")
        debugPrint("Displaying News data : \(selectedNews.title) ")

    }

}
