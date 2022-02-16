//
//  NetworkReachability.swift
//  FrameworkChallange
//
//  Created by Ronaldo Filho on 16/02/22.
//

import Foundation
import Alamofire

class NetworkReachability {
    static let shared = NetworkReachability()
    
    let reachabilityManager = NetworkReachabilityManager(host: "www.google.com")
    
    func startNetworkMonitoring() {
        reachabilityManager?.startListening { status in
            switch status {
            case .notReachable:
                self.showOfflineAlert()
            case .reachable(.cellular):
                self.dismissOfflineAlert()
            case .reachable(.ethernetOrWiFi):
                self.dismissOfflineAlert()
            case .unknown:
                print("<\(type(of: self)) connection = unknown network state>")
            }
        }
    }
    
    func showOfflineAlert() {
        print("<\(type(of: self)) connection = offline>")
    }
    
    func dismissOfflineAlert() {
        print("<\(type(of: self)) connection = online")
    }
    
}
