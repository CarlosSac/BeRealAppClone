//
//  DetailPostViewController.swift
//  BeRealAppClone
//
//  Created by Carlos Sac on 10/7/25.
//

import UIKit
import Alamofire
import AlamofireImage
import ParseSwift

class DetailPostViewController: UIViewController {
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
    var post: Post?
    private var imageDataRequest: DataRequest?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    private func configureView() {
        guard let post = post else { return }
        
        if let user = post.user {
            usernameLabel.text = user.username
        }
        
        if let imageFile = post.imageFile,
           let imageUrl = imageFile.url {
            imageDataRequest = AF.request(imageUrl).responseImage { [weak self] response in
                switch response.result {
                case .success(let image):
                    self?.postImageView.image = image
                case .failure(let error):
                    print("❌ Error fetching image: \(error.localizedDescription)")
                }
            }
        }
        
        captionLabel.text = post.caption
        locationLabel.text = post.location ?? "Cupertino, CA"
        
        if let date = post.createdAt {
            dateLabel.text = RelativeDateTimeFormatter.postRelativeFormatter.localizedString(for: date, relativeTo: Date())
        }
    }
    
    deinit {
        imageDataRequest?.cancel()
    }
}
