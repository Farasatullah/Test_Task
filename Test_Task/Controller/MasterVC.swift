//
//  MasterVC.swift
//  Test_Task
//
//  Created by Farasat_Niazi on 04/01/2024.
//

import UIKit

class MasterVC: UIViewController {

    @IBOutlet weak var table: UITableView!
    var newsData = [NewsResponseData]()
    static var delegate: newsSelectionDelegate?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        DataManager.sharedInstance().detailList { data, success in
               print("Data count: \(data.count)")
               print("Success: \(success)")
               // Use 'data' here as needed in your app
           }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetail",
           let destinationVC = segue.destination as? DetailVC,
           let selectedNews = sender as? News {
            debugPrint("selected news : \(selectedNews)")
//            DetailVC.newsSelected(selectedNews)
        }
    }
    
}
extension MasterVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ShowDetail", sender: newsData[indexPath.row])

        
        
    }
}

extension MasterVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsData.count
   }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
   let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = newsData[indexPath.row].copyright
   return cell
   }
}

protocol newsSelectionDelegate{
    
    func newsSelected(selectedNews: News)
}

