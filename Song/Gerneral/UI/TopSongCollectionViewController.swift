//
//  ViewController.swift
//  Song
//
//  Created by Yangsheng Zou on 2021-01-29.
//  Copyright © 2021 Yangsheng. All rights reserved.
//

import UIKit

class TopSongCollectionViewController:UICollectionViewController, DataSourceDelegate & UIDelegate {
    typealias T = Song
    var viewModel: TopSongViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configure()
        
        fetchData()
       
               
        // Do any additional setup after loading the view.
    }
    
    
    
    
    func configure() {
        self.collectionView.dataSource = viewModel.dataSource
        self.collectionView.register(UINib(nibName: "TopSongCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "top")
        viewModel.delegate = self
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(fetchData))
        
    }

    
    @IBAction func fetchData() {
        viewModel.fetchData()
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let song = viewModel.item(indexPath: indexPath) else {return}
        self.showDetai(item: song, completion: nil)
    }
    
    
 
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        collectionView.collectionViewLayout.invalidateLayout()
    }
    


}



extension TopSongCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
           return 10
       }
        
       
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
       
       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let division = UIDevice.current.orientation.isLandscape ? 4 : 2
        let width = collectionView.bounds.width/CGFloat(division) - 20
        return CGSize(width: width, height: 1.3 * width)
       }
}






extension TopSongCollectionViewController: DetailPresenter {
    func showDetai(item: Song, completion: (() -> Void)?) {
        let vc = ControllerGenerator.getController(type: .SongDetail(song: item))
        self.present(vc, animated: true, completion: nil)
        
    }
 
}
