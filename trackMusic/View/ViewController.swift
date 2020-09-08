//
//  ViewController.swift
//  trackMusic
//
//  Created by Douglas  Goulart Nunes on 11/09/19.
//  Copyright © 2019 Douglas Nunes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  // MARK: - Private properties
  
  fileprivate var viewModel: TrackMusicViewModel!
  fileprivate let datasource: TrackMusicDatasource = TrackMusicDatasource()
  
  // MARK: - Initializers
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    viewModel = TrackMusicViewModel(with: self, datasource: datasource)
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    viewModel = TrackMusicViewModel(with: self, datasource: datasource)
  }

  // MARK: - Outlets
  @IBOutlet weak var tableview: UITableView!
  @IBOutlet weak var progress: UIActivityIndicatorView!
  
  fileprivate enum ViewState {
    case loading
    case normal
    case error
  }
  
  fileprivate var state: ViewState = .normal {
    didSet {
      self.setupView()
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    initUI()
    
    self.state = .loading
    viewModel.fetchMusics()
  }
  
  fileprivate func initUI() {
    self.setupTableView()
  }
  
  fileprivate func setupTableView() {
    registerCell()
    
    tableview.dataSource = datasource
    tableview.estimatedRowHeight = 44
    tableview.rowHeight = UITableView.automaticDimension
    tableview.tableFooterView = UIView()
    
    }

    fileprivate func registerCell() {
      datasource.registerCell(tableview)
    }
  
    fileprivate func setupView() {
      switch state {
      case .loading:
        self.tableview.isHidden = true
        self.progress.startAnimating()

      case .normal:
        self.progress.stopAnimating()
        self.tableview.isHidden = false
        self.tableview.reloadData()
        
      case.error:
        self.progress.stopAnimating()
        self.tableview.isHidden = true
      }
    }

}

// MARK: - ViewModelDelegate

extension ViewController: TrackMusicViewModelDelegate {
  
  func musicsFetchWithSucess() {
    self.state = .normal
  }
  
  func errorToFetchMusics(_ error: String) {
    self.state = .error
    self.showError(error)
  }
  
}
