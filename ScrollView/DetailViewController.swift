//
//  DetailViewController.swift
//  ScrollView
//
//  Created by Jonathan Nunez on 7/13/22.
//

import UIKit

class DetailViewController: UIViewController {
    
    var imageView: UIImageView!
    
    convenience init(imageView: UIImageView) {
        self.init()
        self.imageView = imageView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray
        view.addSubview(imageView)
        imageView.snp.remakeConstraints { make in
            make.edges.equalTo(view.snp_margins)
        }
    }
    
}
