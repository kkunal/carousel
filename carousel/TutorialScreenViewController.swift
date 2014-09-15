//
//  TutorialScreenViewController.swift
//  carousel
//
//  Created by Kunal Kshirsagar on 9/13/14.
//  Copyright (c) 2014 Yahoo. All rights reserved.
//

import UIKit

class TutorialScreenViewController: UIViewController,UIScrollViewDelegate {

    @IBOutlet weak var takeButton: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentSize = CGSize(width: 1280, height: 568)
        scrollView.delegate = self
        // Do any additional setup after loading the view.
        takeButton.alpha = 0.00
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView!) {
        // Get the current page based on the scroll offset
        var page : Int = Int(round(scrollView.contentOffset.x / 320))
        //println("page no: \(page)")
        // Set the current page, so the dots will update
        pageControl.currentPage = page
        if(page == 3){
            pageControl.alpha = 0.00
            takeButton.alpha = 1.00
  //          takeButton.imageView?.alpha = 1.00
        } else {
            pageControl.alpha = 1.00
            takeButton.alpha = 0.00
   //         takeButton.imageView?.alpha = 0.00
        }
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
