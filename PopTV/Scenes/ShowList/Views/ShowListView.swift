//
//  ShowListView.swift
//  PopTV
//
//  Created by Gülenay Gül on 14.02.2020.
//  Copyright © 2020 glnygl. All rights reserved.
//

import RxCocoa

final class ShowListView: BaseXibView, BaseViewProtocol {
    
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
    
    override func setupView() {
        
    }
    
    func viewModelDidSet() {
        guard let vm = self.viewModel else { return }
        vm.shows.asObservable().bind(to: self.collectionView.rx.items){(collectionView, row, item) -> UICollectionViewCell in
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
        let widthSize = (UIScreen.main.bounds.width - 40)/2
        let heightSize = CGFloat(280)
        return CGSize(width: widthSize, height: heightSize)
    }
}




//let widthSize = UIScreen.main.bounds.width/3-4
//  let heightSize = UIScreen.main.bounds.height/3.3-4
//  let layout = UICollectionViewFlowLayout()
//  // layout.sectionInset = UIEdgeInsetsMake(0, 2, 0, 2)
//  layout.itemSize = CGSize(width: widthSize, height: heightSize)
//  layout.minimumInteritemSpacing = 4
//  layout.minimumLineSpacing = 4
//
//  collectionView.collectionViewLayout = layout


