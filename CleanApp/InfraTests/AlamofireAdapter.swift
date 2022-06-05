import Alamofire
import Foundation
import Data

class AlamofireAdapter {
    private let session: Session
    
    init(session: Session = .default) {
        self.session = session
    }
    
    func post(to url: URL, with data: Data?, completion: @escaping (Result<Data, HttpError>) -> Void) {
        let json = data?.toJson()
        session.request(url, method: .post, parameters: json, encoding: JSONEncoding.default).responseData { dataResponse in
            switch dataResponse.result {
            case .failure: completion(.failure(.noConnectivity))
            case .success: break
            }
        }
    }
}
