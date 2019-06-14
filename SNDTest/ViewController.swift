import UIKit

class SNDCell: UITableViewCell {
    override var isSelected: Bool {
        didSet {
            if self.isSelected {
                let background = UIView()
                background.backgroundColor = UIColor.red
                self.selectedBackgroundView = background
            } else {
                self.selectedBackgroundView = nil
            }
        }
    }
}

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    let cellIdentifier = "cellIdentifier"
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - UICollectionView Data source
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
     
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath)
        
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = UIColor.cyan
        } else {
            cell.backgroundColor = UIColor.orange
        }

        if cell.isSelected {
            cell.selectedBackgroundView?.backgroundColor = UIColor.red
        }
        
        return cell
    }
    
    // MARK: - UICollectionView Delegate
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = UICollectionViewCell()
        cell.isSelected = true
        collectionView.reloadItems(at: [indexPath])
    }

}
