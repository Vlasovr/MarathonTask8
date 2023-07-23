import UIKit

final class ViewController: UIViewController, UIScrollViewDelegate {
    
    private lazy var scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.contentSize = CGSize(width: view.bounds.width, height: 1500)
        sv.delegate = self
        sv.backgroundColor = .orange
        return sv
    }()
    
    private lazy var imageView: UIImageView = {
        let iv = UIImageView(image: UIImage(systemName: "person.crop.circle.fill"))
        iv.clipsToBounds = true
        return iv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = scrollView
        setupUI()
    }
    
    private func setupUI(){
        title = "Avatar"
        guard let navigationBar = self.navigationController?.navigationBar else { return }
        navigationBar.addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.rightAnchor.constraint(equalTo: navigationBar.rightAnchor, constant: -20),
            imageView.bottomAnchor.constraint(equalTo: navigationBar.bottomAnchor, constant: -8),
            imageView.heightAnchor.constraint(equalToConstant: 36),
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor)
        ])
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let window = UIApplication.shared.windows.first
        let topPadding = window?.safeAreaInsets.top ?? 0
        let offsetY = scrollView.contentOffset.y
        print(offsetY)
        if offsetY >= -149.6 {
            imageView.transform = .init(translationX: 0, y: offsetY)
        } else {
            imageView.transform = .init(translationX: 0, y: 36)
        }
    }
}

