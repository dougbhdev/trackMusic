//
//  Service.swift
//  trackMusic
//
//  Created by Douglas  Goulart Nunes on 11/09/19.
//  Copyright © 2019 Douglas Nunes. All rights reserved.
//

import Foundation


struct Service {
    
  static let shared = Service()
  
  fileprivate init() {}

  func fetchMusic(completion: @escaping([TrackMusic]?, Error?) -> Void) {
    let urlString = "https://itunes.apple.com/search?media=music&term=eminem"

    guard let url = URL(string: urlString) else {
      completion(nil, NSError(domain: "A malformed url", code: 500, userInfo: nil))
      return
    }

    URLSession.shared.dataTask(with: url) { (data, response, error) in

      var musics: [TrackMusic] = []

      if let error = error {
        completion(nil, error)

        debugPrint("🤷🏽‍♂️ Error: \(error.localizedDescription)")
        return
      }

      guard let data = data, let results = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any], let items = results["results"] as? [[String: Any]] else {
        completion(nil, NSError(domain: "An error ocurred durating serialize flow", code: 500, userInfo: nil))
        return
      }
      
      for item in items {
        if let data = try? JSONSerialization.data(withJSONObject: item, options: []), let music = try? JSONDecoder().decode(TrackMusic.self, from: data) {
          musics.append(music)
        }
      }

      DispatchQueue.main.async {
        completion(musics, nil)
      }
    }.resume()
  }
}
