//
//  Extension.swift
//  NotificationDemo
//
//


import Foundation

extension String {
    
    enum UNNotificationAction : String {
        case Accept
        case Reject
        case Input
    }
    
    enum UNNotificationCategory : String {
        case Normal
        case Image
        case Gif
    }
    
    enum UNNotificationRequest : String {
        case LocalPushNormal
        case LocalPushWithImage
        case LocalPushWithGif
        case LocalPushWithTrigger
    }
}

extension URL {
    
    enum ResourceType : String {
        case Image
        case Gif
        case Remote
        case AttachmentRemote
    }
    
    static func resource(type :ResourceType) -> URL {
        switch type {
        case .Image:
            let path: String = Bundle.main.pathForResource("Assets", ofType: "xcassets")!
            let bundle: Bundle = Bundle.init(path: path)!
            return bundle.urlForResource("2016060810591211", withExtension: "png")!
        case .Gif:
            return Bundle.main.urlForResource("hahaha", withExtension: "gif")!
        case .Remote:
            return URL(string: "http://ww1.sinaimg.cn/large/65312d9agw1f59leskkcij20cs0csmym.jpg")!
        case .AttachmentRemote:
            return URL(string: "https://assets-cdn.github.com/images/modules/open_graph/github-mark.png")!
        }
    }
}

extension URLSession {
    
    class func downloadImage(atURL url: URL, withCompletionHandler completionHandler: (Data?, NSError?) -> Void) {
        let dataTask = URLSession.shared.dataTask(with: url) { (data, urlResponse, error) in
            completionHandler(data, error)
        }
        dataTask.resume()
    }
}

