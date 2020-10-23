//
//  ViewController.swift
//  networking
//
//  Created by Onopriienko.Sergii on 23.10.2020.
//  Copyright © 2020 Onopriienko.Sergii. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var lable: UILabel!
    @IBOutlet weak var getImageButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func getImagePressed(_ sender: Any) {
        
        guard let url = URL(string: "https://miro.medium.com/max/1400/0*ihTZPO4iffJ8n69_") else { return }
        
        let session = URLSession.shared
            session.dataTask(with: url) { (data, response, error) in
                if let data = data, let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.lable.isHidden = true
                        self.getImageButton.isEnabled  = false
                        self.imageView.image = image
                    }
                }
            }.resume()
    }
    
}

