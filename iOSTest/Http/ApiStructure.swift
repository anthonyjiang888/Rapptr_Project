import Foundation
import SwiftyJSON


//-- Login
class StReqLogin: NSObject, Encodable {
    var email   : String = ""
    var password: String = ""
}


class StRspLogin: NSObject, Decodable {
    var code   : String? = ""
    var message: String? = ""
}


//-- Get News List
class StChatMessage: NSObject, Decodable {
    var user_id     : String? = ""
    var name        : String? = ""
    var avatar_url  : String? = ""
    var message     : String? = ""
}

@objc class StRspChat: NSObject, Decodable {
    @objc public var data : [StChatMessage]? = [StChatMessage]()
}
