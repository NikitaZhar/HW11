//
//  NetworkManager.swift
//  AudioDB
//
//  Created by Nikita Zharinov on 07/03/2021.
//

import Foundation
import Alamofire

class NetworkManager {
    
    static let shared = NetworkManager()
    private init() {}
    
    func fetchData(_ completion: @escaping (Loved) -> Void) {
        
        var trackList = Loved(loved: [])
        
        let headers: HTTPHeaders = [
            "x-rapidapi-key": "ba46bd7df0msh469bac161b46366p169216jsn28b13e628019",
            "x-rapidapi-host": "theaudiodb.p.rapidapi.com"
        ]
        let requestURL = "https://theaudiodb.p.rapidapi.com/mostloved.php?format=track"

        AF.request(requestURL, headers: headers)
            .validate()
            .responseJSON { (responseData) in
                switch responseData.result {
                case .failure(let error):
                    print(error)
                case .success(let alltracks):
                    guard let tracksData = alltracks as? [String: [Any]] else { return }
                    guard let tracks = tracksData["loved"] as? [[String: Any]] else { return }
                    
                    for trackData in tracks {
                        let track = LovedTrack(strTrack: trackData["strTrack"] as? String,
                                               strArtist: trackData["strArtist"] as? String,
                                               strAlbum: trackData["strAlbum"] as? String,
                                               strTrackThumb: trackData["strTrackThumb"] as? String
                        )
                        trackList.loved!.append(track)
                    }
                    DispatchQueue.main.async {
                        completion(trackList)
                    }
                }
            }
    }

}
