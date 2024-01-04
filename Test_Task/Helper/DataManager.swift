//
//  DataManger.swift
//  Test_Task
//
//  Created by Farasat_Niazi on 04/01/2024.
//

import Foundation
import Alamofire

class DataManager{
    
    private static  let shared_Instance = DataManager()
    
    static func sharedInstance() -> DataManager{
        return shared_Instance
    }
    
    
    func detailList(result: @escaping ((_ data: [NewsResponse], _ success: Bool) -> Void)) {
        let params: Parameters = [:]
        
        AF.request(BASE_URL + "api-key=%20" + API_KEY, method: .get, parameters: params, headers: nil)
            .responseDecodable(decoder: JSONDecoder(), completionHandler: { (response: DataResponse<[NewsResponse], AFError>) in
                switch response.result {
                case .success(let newsData):
                    // Use the received newsData here as needed
                    result(newsData, true)
                case .failure(let error):
                    debugPrint("error : \(error)")
                    result([], false)
                }
            })
    }


    
}
