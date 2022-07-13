import UIKit
import SnapKit

class ViewController: UIViewController {

    let scrollView = UIScrollView()
    let contentView = UIView()
        
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
    
    func createCard() -> UIView {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 100))
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        return view
    }
    
    func setupViews() {
        let card1 = createCard()
        let card2 = createCard()
        let card3 = createCard()
        let card4 = createCard()
        let card5 = createCard()
        
        let stackView = UIStackView(arrangedSubviews: [card1, card2, card3, card4, card5])
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
