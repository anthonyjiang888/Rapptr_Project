import Foundation

extension URLSession {
    static var lock: NSLock = NSLock()

    func load<TYPE_RSP>(
        _ request : RequestPost<TYPE_RSP>,
        completion: @escaping (TYPE_RSP?) -> Void
    ) {
        dataTask(with: request.requestUrl) { data, response, _ in
            if let response = response as? HTTPURLResponse,
                (200..<300).contains(response.statusCode)
            {
                completion(data.flatMap(request.parse))
            }
            else {
                completion(nil)
            }
        }.resume()
    }

}
