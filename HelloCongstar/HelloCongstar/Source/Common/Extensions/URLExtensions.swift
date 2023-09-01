//import Foundation
//
//extension URL {
//    
//    func appendingQueryItem(name: String, value: String?) -> URL {
//        guard var urlComponents = URLComponents(string: absoluteString) else { return self }
//        var queryItems: [URLQueryItem] = urlComponents.queryItems ?? []
//        let queryItem = URLQueryItem(name: name, value: value)
//        queryItems.append(queryItem)
//        urlComponents.queryItems = queryItems
//        guard let url = urlComponents.url else {
//            return self
//        }
//        return url
//    }
//}
