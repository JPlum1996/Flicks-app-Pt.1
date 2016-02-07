//
//  DetailViewController.swift
//  MovieViewerJ
//
//  Created by Joe Plumitallo on 2/4/16.
//  Copyright © 2016 Joe Plumitallo. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var infoView: UIView!
    @IBOutlet weak var popLabel: UILabel!
    @IBOutlet weak var popularityLabel: UILabel!
    @IBOutlet weak var popImage: UIImageView!
    @IBOutlet weak var calImage: UIImageView!
    
    
    
    var movie: NSDictionary!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.contentSize = CGSize(width: scrollView.frame.size.width, height: infoView.frame.origin.y + infoView.frame.size.height)
        
        
        let title = movie["title"] as? String
        titleLabel.text = title
        
        let overview = movie["overview"]
        overviewLabel.text = overview as? String
        
        let releaseDate = movie["release_date"]
        popLabel.text = releaseDate as? String
        
        let popularity = movie["vote_average"]
        popularityLabel.text = "\(popularity!)/10"
        
        popImage.image = UIImage(named: "iconmonstr-star-2-16")
        calImage.image = UIImage(named: "iconmonstr-calendar-4-16")
        
        overviewLabel.sizeToFit()
        popLabel.sizeToFit()
        popularityLabel.sizeToFit()
        infoView.sizeToFit()
        popImage.sizeToFit()
        calImage.sizeToFit()
        
        let baseUrl = "http://image.tmdb.org/t/p/w500"
        
        if let posterPath = movie["poster_path"] as? String{
            
            let imageUrl = NSURL(string:baseUrl + posterPath)
            posterImageView.setImageWithURL(imageUrl!)
            

            
        }
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
