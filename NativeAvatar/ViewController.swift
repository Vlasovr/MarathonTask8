import UIKit

final class ViewController: UIViewController {
    
    private lazy var scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.contentSize = CGSize(width: view.bounds.width, height: 1500)
        sv.backgroundColor = .purple
        return sv
    }()
    
    private lazy var avatarImage: UIImageView = {
        let av = UIImageView(image: UIImage(systemName: "person.crop.circle.fill"))
        av.tintColor = .systemGray
        av.clipsToBounds = true
        return av
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = scrollView
        setupUI()
        
    }
    
    private func setupUI(){
        title = "Avatar"
        
        guard let navigationBar = navigationController?.navigationBar else { return }
        
        for subview in navigationBar.subviews {
            if NSStringFromClass(subview.classForCoder).contains("UINavigationBarLargeTitleView") {
                
                subview.addSubview(avatarImage)
                
                avatarImage.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint.activate([
                    avatarImage.rightAnchor.constraint(equalTo: subview.rightAnchor,
                                                       constant: -20),
                    avatarImage.topAnchor.constraint(equalTo: subview.bottomAnchor, constant: 20),
                    avatarImage.bottomAnchor.constraint(equalTo: avatarImage.superview?.bottomAnchor ?? navigationBar.bottomAnchor, constant: -10),
                    avatarImage.heightAnchor.constraint(equalToConstant: 36),
                    avatarImage.widthAnchor.constraint(equalToConstant: 36)
                ])
            }
        }
    }
}



