//
//  ViewController.swift
//  GAFilterPhotoApp
//
//  Created by Charlie Morris on 24/01/2016.
//  Copyright © 2016 Mind Fund Studio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dogImage: UIImageView!
    let context = CIContext(options: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func applyFilterButtonPressed(sender: UIBarButtonItem) {
    
        // Create an image to filter
        let inputImage = CIImage(image: dogImage.image!)
        
        // Create a random color to pass to a filter
        let randomColor = [kCIInputAngleKey: (Double(arc4random_uniform(314)) / 100)]
        
        // Apply a filter to the image
        let filteredImage = inputImage!.imageByApplyingFilter("CIHueAdjust", withInputParameters: randomColor)
        
        // Render the filtered image
        let renderedImage = context.createCGImage(filteredImage, fromRect: filteredImage.extent)
        
        // Reflect the change back in the interface
        dogImage.image = UIImage(CGImage: renderedImage)
    
    }
    

}

