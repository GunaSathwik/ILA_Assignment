//
//  ViewController.swift
//  ILA_BANK_ASSIGNMENT
//
//  Created by Guna  Maddali on 17/02/24.
//

import UIKit

class ViewController: UIViewController, UISearchBarDelegate {

    var images: [UIImage] = []
    var imagesArray: [UIImage] = TableViewData.noodlesImages
    var namesArray: [String] =  TableViewData.noodlesNames
    var filteredArray: [String] = []
    var isSearching: Bool = false

    weak var delegate: CollectionViewDelegate?

    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
        collectionView.layer.cornerRadius = 12
        collectionView.layer.borderWidth = 4
        collectionView.layer.borderColor = UIColor.lightGray.cgColor
        collectionView.register(CarouselImageViewCollectionViewCell.self, forCellWithReuseIdentifier: "carouselView")
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(ItemsTableViewCell.self, forCellReuseIdentifier: "itemsTableViewCell")
        tableView.separatorStyle = .singleLine
        tableView.separatorColor = .lightGray
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()

    private lazy var searchBarContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.placeholder = "Enter a dish name"
        return searchBar
    }()

    override func viewDidLoad() {
        super.viewDidLoad()


        if let noodlesImage = UIImage(named: "noodles"),
           let friedRiceImage = UIImage(named: "friedrice"),
           let biryaniImage = UIImage(named: "Biryani") {
            images = [noodlesImage, friedRiceImage, biryaniImage]
        } else {
            print("Error loading images.")
        }
        self.delegate = self
        searchBar.delegate = self
        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = true
        filteredArray = namesArray
        setupViewHeirarchy()
        setupConstraints()
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        isSearching = true
        filteredArray = namesArray.filter({ $0.lowercased().contains(searchText.lowercased()) })
        if searchText.isEmpty {
            isSearching = false
        }
        tableView.reloadData()
    }

    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        isSearching = false
        tableView.reloadData()
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        isSearching = false
        tableView.reloadData()
    }

    private func setupViewHeirarchy() {
        view.addSubview(collectionView)
        view.addSubview(searchBarContainerView)
        view.addSubview(searchBar)
        view.addSubview(tableView)
    }

    private func setupConstraints() {
        var constraints: [NSLayoutConstraint] = []

        // Collection View
        constraints.append(collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20))
        constraints.append(collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10))
        constraints.append(collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10))
        constraints.append(collectionView.heightAnchor.constraint(equalToConstant: 150))

        // Search Bar container view
        constraints.append(searchBarContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor))
        constraints.append(searchBarContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor))
        constraints.append(searchBarContainerView.topAnchor.constraint(equalTo: collectionView.bottomAnchor))

        // Search Bar
        constraints.append(searchBar.leadingAnchor.constraint(equalTo: searchBarContainerView.leadingAnchor, constant: 10))
        constraints.append(searchBar.trailingAnchor.constraint(equalTo: searchBarContainerView.trailingAnchor, constant: -10))
        constraints.append(searchBar.topAnchor.constraint(equalTo: searchBarContainerView.topAnchor, constant: 10))
        constraints.append(searchBar.bottomAnchor.constraint(equalTo: searchBarContainerView.bottomAnchor, constant: 10))

        // Table View
        constraints.append(tableView.leadingAnchor.constraint(equalTo: collectionView.leadingAnchor))
        constraints.append(tableView.trailingAnchor.constraint(equalTo: collectionView.trailingAnchor))
        constraints.append(tableView.topAnchor.constraint(equalTo: searchBarContainerView.bottomAnchor, constant: 20))
        constraints.append(tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor))

        NSLayoutConstraint.activate(constraints)
    }
}

extension ViewController: CollectionViewDelegate {

    func didSelectItem(at index: Int) {
        if index == 0 {
            imagesArray = TableViewData.noodlesImages
            namesArray = TableViewData.noodlesNames
        } else if index == 1 {
            imagesArray = TableViewData.friedRiceImages
            namesArray = TableViewData.friedRiceNames
        } else if index == 2 {
            imagesArray = TableViewData.biryaniImages
            namesArray = TableViewData.biryaniNames
        }
        self.tableView.reloadData()
    }

}

