//
//  TrackMusicDatasource.swift
//  trackMusic
//
//  Created by Douglas  Goulart Nunes on 11/09/19.
//  Copyright © 2019 Douglas Nunes. All rights reserved.
//

import UIKit

class TrackMusicDatasource: NSObject, UITableViewDataSource {
  
  var musics = [TrackMusic]()
  
  // MARK: - Commom methods
  
  func registerCell(_ tableView: UITableView) {
    let nib = UINib(nibName: "TrackMusicCell", bundle: nil)
    tableView.register(nib, forCellReuseIdentifier: "TrackMusicCell")
  }
  
  // MARK: - Datasource methods
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return musics.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "TrackMusicCell") as? TrackMusicCell else {
      return UITableViewCell()
    }
    
    cell.selectionStyle = .none
    cell.setup(with: musics[indexPath.row])
    
    return cell
  }
  
}
