//
//  ProductRepo.swift
//  LogicPrecDemo
//
//  Created by Pushpendra Rajput  on 29/04/25.
//

import Foundation
import DGNetworkingServices
class ProductRepo {
    
    func fetchProduct(completion:@escaping(_ resStatus:Int,_ resMessage:String,_ resData:[ProductList]?)->()) {
        
        let apiUrl = "\(ServiceNameConstant.BaseUrl.baseUrl)\(ServiceNameConstant.login)"
        
        DGNetworkingServices.main.MakeApiCall(Service: NetworkURL(withURL: apiUrl), HttpMethod: .get, parameters: nil, headers: nil) { result in
            
            switch result {
                
            case .success((_, let response)):
                do {
                    let resData = try JSONDecoder().decode(ProductsData.self, from: response)
                    completion(1,"",resData.products)
                    
                } catch (let error) {
                    completion(0,error.localizedDescription,nil)
                }
                
            case .failure(let error):
                print(error)
                completion(0,error.rawValue,nil)
            }
            
            
        }
        
    }
    
}
