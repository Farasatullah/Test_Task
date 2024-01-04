//
//  LoginResponse.swift
//  Test_Task
//
//  Created by Farasat_Niazi on 04/01/2024.
//

import Foundation

struct NewsResponse: Decodable {
    var object: NewsResponseData
}

struct NewsResponseData: Decodable {
    var status: String
    var copyright: String
    var num_results: Int
    var newsArray: [News]
}
