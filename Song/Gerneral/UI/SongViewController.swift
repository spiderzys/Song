//
//  SongViewController.swift
//  Song
//
//  Created by Yangsheng Zou on 2021-01-31.
//  Copyright © 2021 Yangsheng. All rights reserved.
//

import UIKit
import AVKit
class SongViewController: UIViewController {
    
    var viewModel: SongViewModel?
    var player: Previewer?
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let song = viewModel?.song else {return}
        updateUI(song: song)
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func preView(_ sender: UIButton) {
    
        
        
        guard let item = viewModel?.song else {return}
        player?.preview(item: item)
        sender.isHidden = true
        
    }
    
    
    func updateUI(song: Song) {
        nameLabel.text = song.name
        artistLabel.text = song.artist
        priceLabel.text = song.price
        releaseDateLabel.text = song.releaseDate
        guard let url = song.artUrl else {return}
        self.backgroundImageView.load(url: url)
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
