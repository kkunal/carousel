//
//  IntroViewController.swift
//  carousel
//
//  Created by Kunal Kshirsagar on 9/11/14.
//  Copyright (c) 2014 Yahoo. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var introImageView: UIImageView!
    @IBOutlet weak var introScrollView: UIScrollView!
    
    @IBOutlet weak var tileView1: UIImageView!
    @IBOutlet weak var tileView2: UIImageView!
    @IBOutlet weak var tileView3: UIImageView!
    @IBOutlet weak var tileView4: UIImageView!
    @IBOutlet weak var tileView5: UIImageView!
    @IBOutlet weak var tileView6: UIImageView!
    var yOffsets : [Float] = [-285, -240, -415, -408, -480, -500]
    var xOffsets : [Float] = [-30, 75, -66, 10, -200, -15]
    var scales : [Float] = [1, 1.65, 1.7, 1.6, 1.65, 1.65]
    var rotations : [Float] = [-10, -10, 10, 10, 10, -10]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        introScrollView.contentSize = introImageView.image!.size
        introScrollView.delegate = self
        // Do any additional setup after loading the view.
        introScrollView.sendSubviewToBack(introScrollView)
    }
    
    func convertValue(value: Float, r1Min: Float, r1Max: Float, r2Min: Float, r2Max: Float) -> Float {
        var ratio = (r2Max - r2Min) / (r1Max - r1Min)
        return value * ratio + r2Min - r1Min * ratio
    }

    func scrollViewDidScroll(scrollView: UIScrollView!){
        transformView(scrollView,imageView: tileView1,x: 1)
        transformView(scrollView,imageView: tileView2,x: 2)
        transformView(scrollView,imageView: tileView3,x: 3)
        transformView(scrollView,imageView: tileView4,x: 4)
        transformView(scrollView,imageView: tileView5,x: 5)
        transformView(scrollView,imageView: tileView6,x: 6)
    }
    
    func transformView(scrollView: UIScrollView!, imageView: UIImageView!, x: Int) {
        var offset = Float(scrollView.contentOffset.y)
       // println("content offset : \(scrollView.contentOffset.y)")
        
        
        var tx = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: xOffsets[x-1], r2Max: 0)
        var ty = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: yOffsets[x-1], r2Max: 0)
        var scale = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: scales[x-1], r2Max: 1)
        var rotation = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: rotations[x-1], r2Max: 0)
        
        imageView.transform = CGAffineTransformMakeTranslation(CGFloat(tx),CGFloat(ty))
        
        imageView.transform = CGAffineTransformScale(imageView.transform, CGFloat(scale), CGFloat(scale))
        
        imageView.transform = CGAffineTransformRotate(imageView.transform, CGFloat(Double(rotation) * M_PI/180))

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
