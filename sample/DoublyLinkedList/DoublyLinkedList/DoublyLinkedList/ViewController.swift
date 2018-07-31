//
//  ViewController.swift
//  DoublyLinkedList
//
//  Created by Muhand Jumah on 7/30/18.
//  Copyright © 2018 Muhand Jumah. All rights reserved.
//

import UIKit
import malgorithms

class ViewController: UIViewController {
    var navigator: LinkedListNavigator<UIImage>?
    var datasource: DoublyLinkedList<UIImage>?
    var index = 0
    
    @IBOutlet var miniImagesCollectionView: UICollectionView!
    @IBOutlet var imageView: UIImageView!
    
    @IBAction func next(_ sender: Any) {
        self.navigator?.moveRight()
    }
    @IBAction func previous(_ sender: Any) {
        self.navigator?.moveLeft()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setUpData()
//        self.navigator = LinkedListNavigator(linkedList: self.datasource!)
        self.navigator = LinkedListNavigator(linkedList: self.datasource!, startAtIndex: (self.datasource?.length)!/2)
        self.navigator?.delegate = self
        self.imageView.image = self.navigator?.currentNode?.value
    }
    
    override func viewDidAppear(_ animated: Bool) {
//        self.miniImagesCollectionView.selectItem(at: IndexPath(row: index, section: 0), animated: true, scrollPosition: UICollectionViewScrollPosition.left)
//        let cell = self.miniImagesCollectionView.cellForItem(at: IndexPath(row: index, section: 0)) as! ImageCollectionViewCell
//        cell.layer.borderWidth = 3.0
//        cell.layer.borderColor = UIColor.green.cgColor

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setUpData() {
        self.datasource = DoublyLinkedList<UIImage>()
        self.datasource?.append(value: UIImage(named: "space1")!)
        self.datasource?.append(value: UIImage(named: "space2")!)
        self.datasource?.append(value: UIImage(named: "world1")!)
        self.datasource?.append(value: UIImage(named: "joke1")!)
        self.datasource?.append(value: UIImage(named: "joke2")!)
        self.datasource?.append(value: UIImage(named: "snowflake1")!)
        self.datasource?.append(value: UIImage(named: "snowflake2")!)
    }
}

extension ViewController: NavigatorDelegate {
    func selectionChanged<T>(newValue: T) {
        self.imageView.image = newValue as? UIImage
    }
    
    func movedRight() {
//        // Deselect the current image on index
//        self.miniImagesCollectionView.deselectItem(at: IndexPath(row: index, section: 0), animated: true)
//
//        // Change the color and width of border
//        var cell = self.miniImagesCollectionView.cellForItem(at: IndexPath(row: index, section: 0)) as! ImageCollectionViewCell
//        cell.layer.borderWidth = 0.0
//        cell.layer.borderColor = UIColor.clear.cgColor
//
//        // Now check if index is at length -1
//        if index == (datasource?.length)! - 1 {
//            // Then set index back to 0
//            index = 0
////            self.miniImagesCollectionView.scrollToItem(at: IndexPath(row: index, section: 0), at: .centeredHorizontally, animated: true)
//        } else {
//            // Otherwise increase index by 1
//            index += 1
//        }
//
//        // Now make selection to th new index
////        if self.miniImagesCollectionView.visibleCells.index(after: index) == self.miniImagesCollectionView.visibleCells.endIndex {
////            self.miniImagesCollectionView.selectItem(at: IndexPath(row: index+self.miniImagesCollectionView.visibleCells.count-1, section: 0), animated: true, scrollPosition: UICollectionViewScrollPosition.centeredHorizontally)
////        } else {
//            self.miniImagesCollectionView.selectItem(at: IndexPath(row: index, section: 0), animated: true, scrollPosition: UICollectionViewScrollPosition.centeredHorizontally)
////        }
//        self.miniImagesCollectionView.scrollToItem(at: IndexPath(row: index, section: 0), at: .left, animated: true)
//        // Finally set the color of border
//        cell = self.miniImagesCollectionView.cellForItem(at: IndexPath(row: index, section: 0)) as! ImageCollectionViewCell
//        cell.layer.borderWidth = 3.0
//        cell.layer.borderColor = UIColor.green.cgColor
        
    }
    
    func movedLeft() {
////        self.miniImagesCollectionView.deselectItem(at: IndexPath(row: index+1, section: 0), animated: true)
////        self.miniImagesCollectionView.selectItem(at: IndexPath(row: index, section: 0), animated: true, scrollPosition: UICollectionViewScrollPosition.left)
//
//        // Deselect the current image on index
//        self.miniImagesCollectionView.deselectItem(at: IndexPath(row: index, section: 0), animated: true)
//
//        // Change the color and width of border
//        var cell = self.miniImagesCollectionView.cellForItem(at: IndexPath(row: index, section: 0)) as! ImageCollectionViewCell
//        cell.layer.borderWidth = 0.0
//        cell.layer.borderColor = UIColor.clear.cgColor
//
//        // Now check if index is 0
//        if index == 0 {
//            // Then set index back to the datasource length - 1
//            index = (self.datasource?.length)! - 1
//            self.miniImagesCollectionView.scrollToItem(at: IndexPath(row: (self.datasource?.length)! - 1, section: 0), at: .centeredHorizontally, animated: true)
//        } else {
//            // Otherwise decrease index by 1
//            index -= 1
//        }
//
//        // Now make selection to th new index
//        self.miniImagesCollectionView.selectItem(at: IndexPath(row: index, section: 0), animated: true, scrollPosition: UICollectionViewScrollPosition.right)
//
//        // Finally set the color of border
//        cell = self.miniImagesCollectionView.cellForItem(at: IndexPath(row: index, section: 0)) as! ImageCollectionViewCell
//        cell.layer.borderWidth = 3.0
//        cell.layer.borderColor = UIColor.green.cgColor
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (self.datasource?.length)!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCell", for: indexPath) as! ImageCollectionViewCell
        cell.imageView.image = self.datasource?.nodeAt(index: indexPath.row)?.value
        return cell
    }
}

