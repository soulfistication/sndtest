import UIKit

class SNDCell: UICollectionViewCell {
    public func setup(indexPath: IndexPath) {
        if indexPath.row % 2 == 0 {
            backgroundColor = UIColor.cyan
        } else {
            backgroundColor = UIColor.orange
        }
    }
}

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    let cellIdentifier = "cellIdentifier"
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.allowsSelection = true
        collectionView.allowsMultipleSelection = false
    }
    
    // MARK: - UICollectionView Data source
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? SNDCell else {
            fatalError("CollectionView dequeued a wrong cell.")
        }
        
        cell.setup(indexPath: indexPath)
        
        return cell
    }
    
    // MARK: - UICollectionView Delegate
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath)
        cell.isSelected = true
        
        let view = UIView()
        view.backgroundColor = UIColor.red

        cell.selectedBackgroundView = view
    }

}
