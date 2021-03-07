//
//  Model.swift
//  AudioDB
//
//  Created by Nikita Zharinov on 07/03/2021.
//

struct LovedTrack: Decodable {
    let strTrack: String?
    let strArtist: String?
    let strAlbum: String?
    let strTrackThumb: String?
}

struct Loved: Decodable {
    var loved: [LovedTrack]?
}
