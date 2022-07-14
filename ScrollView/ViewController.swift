import UIKit
import SnapKit
import SDWebImage

class ViewController: UIViewController {
    
    var views = [UIView]()

    let scrollView = UIScrollView()
    let contentView = UIView()
    var imageView = UIImageView()
    
    var tag = 0
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setupScrollView()
        setupViews()
    }
    
    func setupScrollView() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        scrollView.snp.remakeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        contentView.snp.remakeConstraints { make in
            make.centerX.equalTo(scrollView.snp.centerX)
            make.width.equalTo(scrollView.snp.width)
            make.top.equalTo(scrollView.snp.top)
            make.bottom.equalTo(scrollView.snp.bottom)
        }
    }
    
    func createCard() -> UIButton {
        let button = UIButton(type: .system)
        button.backgroundColor = .white
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(cardTapped), for: .touchUpInside)
        let iv = createImageView()
        button.addSubview(iv)
        iv.snp.remakeConstraints { make in
            make.centerX.centerY.equalTo(button)
            make.edges.equalTo(button.snp_margins)
        }
        button.tag = tag
        tag += 1
        return button
    }
    
    @objc func cardTapped(sender: UIButton) {
        print("jona tapped")
        let iv = self.createImageView()
        views[sender.tag].addSubview(iv)
        iv.snp.remakeConstraints { make in
            make.centerX.centerY.equalTo(sender)
            make.edges.equalTo(sender.snp_margins)
        }
        print("jona tag:", sender.tag)
        let vc = DetailViewController(imageView: imageView)
        self.present(vc, animated: true)
        imageView = iv
    }
    
    func createImageView() -> UIImageView {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.sd_setImage(with: URL(string: "https://picsum.photos/id/\(Int.random(in: 0..<500))/200/300"), completed: nil)
        return iv
    }
    
    func setupViews() {
        for _ in 1...15 {
            views.append(createCard())
        }
        
        let stackView = UIStackView(arrangedSubviews: views)
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        
        for view in stackView.arrangedSubviews {
            let height = NSLayoutConstraint(item: view, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 200)
            view.addConstraint(height)
        }
        
        contentView.addSubview(stackView)
        stackView.snp.remakeConstraints { make in
            make.centerX.equalTo(contentView)
            make.top.equalTo(contentView).offset(30)
            make.width.equalTo(contentView).multipliedBy(0.75)
            make.bottom.equalTo(contentView)
        }
    }
   
}
