//
//  TrackMusic.swift
//  trackMusic
//
//  Created by Douglas  Goulart Nunes on 11/09/19.
//  Copyright © 2019 Douglas Nunes. All rights reserved.
//

import Foundation

class TrackMusic: Decodable {
    
  let id: Int
  let artistName: String
  let trackName: String
  let cover: String
  let album: String
  
  fileprivate enum CodingKeys: String, CodingKey {
    case id = "artistId"
    case artistName
    case trackName
    case cover = "artworkUrl100"
    case album = "collectionName"
  }

}
