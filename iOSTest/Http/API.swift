import Foundation


@objc class API: NSObject {

    private let URL_LOGIN: String = "http://dev.rapptrlabs.com/Tests/scripts/login.php"
    private let URL_CHAT : String = "http://dev.rapptrlabs.com/Tests/scripts/chat_log.php"

    static let instance: API = API()

    private lazy var defaultSession = URLSession(configuration: .default)


    @objc override public init() {
        super.init()
    }


    @objc func login(stReq: StReqLogin, completion: @escaping (StRspLogin?) -> Void) {
        let request = RequestPost<StRspLogin>(
            url       : URL_LOGIN,
            parameters: stReq.dictionary
        )
        defaultSession.load(request) { rspData in
            guard let data = rspData else {
                completion(nil)
                return
            }
            completion(data)
        }
    }


    @objc func chatLog(completion: @escaping (StRspChat?) -> Void) {
        let request = RequestPost<StRspChat>(
            url       : URL_CHAT,
            parameters: [:]
        )
        defaultSession.load(request) { rspData in
            guard let data = rspData else {
                completion(nil)
                return
            }
            completion(data)
        }
    }
}
