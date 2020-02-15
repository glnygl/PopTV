//
//  ShowListView.swift
//  PopTV
//
//  Created by Gülenay Gül on 14.02.2020.
//  Copyright © 2020 glnygl. All rights reserved.
//

import RxCocoa

final class ShowListView: BaseXibView, BaseViewProtocol {
    
    var cellSize: CGSize {
        let widthSize = (UIScreen.main.bounds.width - 40)/2
        let heightSize: CGFloat = 280.0
        return CGSize(width: widthSize, height: heightSize)
    }
    
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.delegate = self
            collectionView.register(types: [.ShowListCollectionCell])
        }
    }
    
    typealias ViewModelType = ShowListViewModel
    typealias ControllerType = ShowListController
    
    var viewModel: ShowListViewModel?
    var controller: ShowListController?
    
    func viewModelDidSet() {
        guard let vm = self.viewModel else { return }
        vm.shows.bind(to: self.collectionView.rx.items){(collectionView, row, item) -> UICollectionViewCell in
            let indexPath = IndexPath(row: row, section: 0)
            if let cell = collectionView.dequeue(type: CellType.ShowListCollectionCell.rawValue, indexPath: indexPath) as? ShowListCollectionCell{
                cell.assign(model: item)
                return cell
            }
            return UICollectionViewCell()
        }.disposed(by: vm.disposeBag)
        
    }
    
}

extension ShowListView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return cellSize
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let vc = self.viewModel?.controller else { return }
        let storyboard = UIStoryboard.init(name: StoryboardIdentifier.Main.rawValue, bundle: nil)
        if let showDetailVC = storyboard.instantiateViewController(withIdentifier: ControllerIdentifier.ShowDetailController.rawValue) as? ShowDetailController {
            if let show = self.viewModel?.shows.value[indexPath.row] {
                showDetailVC.viewModel.show = show
            }
            vc.navigationController?.pushViewController(showDetailVC, animated: true)
        }
    }
}



