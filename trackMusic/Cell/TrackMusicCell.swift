//
//  TrackMusicCell.swift
//  trackMusic
//
//  Created by Douglas  Goulart Nunes on 11/09/19.
//  Copyright © 2019 Douglas Nunes. All rights reserved.
//

import UIKit

class TrackMusicCell: UITableViewCell {


  @IBOutlet weak var coverImageView: UIImageView!
  @IBOutlet weak var trackNameLabel: UILabel!
  @IBOutlet weak var albumNameLabel: UILabel!
  
  override func prepareForReuse() {
    super.prepareForReuse()

    coverImageView.image = nil
    trackNameLabel.text = ""
    albumNameLabel.text = ""
  }
  
  func setup(with music: TrackMusic) {
    trackNameLabel.text = music.trackName
    albumNameLabel.text = music.album
    coverImageView.loadImage(from: music.cover)
  }
  
}
