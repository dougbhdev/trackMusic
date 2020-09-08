//
//  TrackMusicViewModel.swift
//  trackMusic
//
//  Created by Douglas  Goulart Nunes on 11/09/19.
//  Copyright © 2019 Douglas Nunes. All rights reserved.
//

import Foundation
import UIKit

protocol TrackMusicViewModelDelegate: class {
  
  func musicsFetchWithSucess()
  func errorToFetchMusics(_ error: String)
  
}

struct TrackMusicViewModel {
  
  fileprivate let delegate: TrackMusicViewModelDelegate
  
  fileprivate let datasource: TrackMusicDatasource
  
  init(with delegate: TrackMusicViewModelDelegate, datasource: TrackMusicDatasource) {
    self.delegate = delegate
    self.datasource = datasource
  }
  
  func fetchMusics() {
    Service.shared.fetchMusic { (musics, error) in

      if let responseError = error {
        self.error(responseError.localizedDescription)
        return
      }
      
      if let items = musics {
        self.success(items)
      } else {

        self.error("An error occurred in your request")
      }
    }
  }
  
  // MARK: - Private methods
  
  fileprivate func error(_ error: String) {
    self.delegate.errorToFetchMusics(error)
  }
  
  fileprivate func success(_ musics: [TrackMusic]) {
    datasource.musics = musics
    
    self.delegate.musicsFetchWithSucess()
  }

}
