//
//  DetailViewController.swift
//  MovieViewer
//
//  Created by Lawrence Chong on 2/8/16.
//  Copyright © 2016 Lawrence Chong. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var posterImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var overviewLabel: UILabel!
    
    @IBOutlet weak var infoView: UIView!
    
    
    var movie : NSDictionary!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let title = movie["title"] as? String
        titleLabel.text = title
        
        let overview = movie["overview"] as? String
        overviewLabel.text = overview
        overviewLabel.sizeToFit()

        infoView.frame.size.height = titleLabel.frame.height + overviewLabel.frame.height + 80

        scrollView.contentSize = CGSize(width: scrollView.frame.size.width, height: infoView.frame.origin.y + infoView.frame.size.height)
    
        if let posterPath = movie["poster_path"] as? String{
            let base_url = "http://image.tmdb.org/t/p/w500"
            let image_url = NSURL(string: base_url + posterPath)
            posterImageView.setImageWithURL(image_url!)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
