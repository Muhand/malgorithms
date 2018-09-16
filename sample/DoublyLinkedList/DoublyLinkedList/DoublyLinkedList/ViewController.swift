//
//  ViewController.swift
//  DoublyLinkedList
//
//  Created by Muhand Jumah on 7/30/18.
//  Copyright © 2018 Muhand Jumah. All rights reserved.
//

import UIKit
import malgorithms
import SwiftyAWS
//   var cacheDataSource = NSCache<NSString, UIImage>()

class ViewController: UIViewController {
    var navigator: LinkedListNavigator<UIImage>?
    var datasource: DoublyLinkedList<UIImage>?
 
    @IBOutlet var downloadingIndicator: UILabel!
    
    var index = 0
    var totalImagesLength = 0
    var cacheIndex = 0
    let ids = [
        "f76ebcc832a77cc9954a3cf166bd451b",
        "1d11a1f9f6d1651c1524212f92b0ebf6",
        "ed82ec3ef427b740645c3fb1c17608ce",
        "d0da2cf0e946123be647fe6709efd6ae",
        "71a07db3624670b244fd3f6680c59718",
        "c50198596a73026054c3a8c2850faacf",
        "eb41b86f92a1a0108580fc20bb7c82bf",
        "ed82ec3ef427b740645c3fb1c17608ce",
        "d0da2cf0e946123be647fe6709efd6ae",
        "f76ebcc832a77cc9954a3cf166bd451b",
        "71a07db3624670b244fd3f6680c59718",
        "1d11a1f9f6d1651c1524212f92b0ebf6",
        "c50198596a73026054c3a8c2850faacf",
        "f76ebcc832a77cc9954a3cf166bd451b",
        "1d11a1f9f6d1651c1524212f92b0ebf6",
        "ed82ec3ef427b740645c3fb1c17608ce",
        "d0da2cf0e946123be647fe6709efd6ae",
        "71a07db3624670b244fd3f6680c59718",
        "c50198596a73026054c3a8c2850faacf",
        "eb41b86f92a1a0108580fc20bb7c82bf",
        "ed82ec3ef427b740645c3fb1c17608ce",
        "d0da2cf0e946123be647fe6709efd6ae",
        "f76ebcc832a77cc9954a3cf166bd451b",
        "71a07db3624670b244fd3f6680c59718",
        "1d11a1f9f6d1651c1524212f92b0ebf6",
        "c50198596a73026054c3a8c2850faacf"]
    
    @IBOutlet var totalImages: UILabel!
    @IBOutlet var currentImage: UILabel!
    
    
    @IBOutlet var miniImagesCollectionView: UICollectionView!
    @IBOutlet var imageView: UIImageView!
    
    @IBAction func next(_ sender: Any) {
//        let id = ids[cacheIndex]
//        self.imageView.image = cacheDataSource.object(forKey: id as NSString)
//        cacheIndex += 1
        self.navigator?.moveRight()
    }
    @IBAction func previous(_ sender: Any) {
//        let id = ids[cacheIndex]
//        self.imageView.image = cacheDataSource.object(forKey: id as NSString)
//        cacheIndex -= 1
        self.navigator?.moveLeft()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SwiftyAWS.main.bucketName = "crash-profile-photos"
        SwiftyAWS.main.configure(type: .USEast1, identity: "us-east-1:b5e941a4-9b62-4457-a4db-8cd199514bc9")
        // Do any additional setup after loading the view, typically from a nib.
//        setUpData()
        print("NOOOO")
        self.downloadingIndicator.text = "Downloading..."
        setUpData {
            print("DONEEEE")
            self.downloadingIndicator.text = "Done"
            self.navigator = LinkedListNavigator(linkedList: self.datasource!, startAtIndex: (self.datasource?.length)!/2)
            self.navigator?.delegate = self
            self.imageView.image = self.navigator?.currentNode?.value
        }
//        self.navigator = LinkedListNavigator(linkedList: self.datasource!)
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
    
    func setUpData(completion: @escaping () -> Void) {
        /* IMAGES TO DOWNLOAD
         f76ebcc832a77cc9954a3cf166bd451b
         1d11a1f9f6d1651c1524212f92b0ebf6
         ed82ec3ef427b740645c3fb1c17608ce
         d0da2cf0e946123be647fe6709efd6ae
         71a07db3624670b244fd3f6680c59718
         c50198596a73026054c3a8c2850faacf
         eb41b86f92a1a0108580fc20bb7c82bf
         ed82ec3ef427b740645c3fb1c17608ce
         d0da2cf0e946123be647fe6709efd6ae
         f76ebcc832a77cc9954a3cf166bd451b
         71a07db3624670b244fd3f6680c59718
         1d11a1f9f6d1651c1524212f92b0ebf6
         c50198596a73026054c3a8c2850faacf
         f76ebcc832a77cc9954a3cf166bd451b
         1d11a1f9f6d1651c1524212f92b0ebf6
         ed82ec3ef427b740645c3fb1c17608ce
         d0da2cf0e946123be647fe6709efd6ae
         71a07db3624670b244fd3f6680c59718
         c50198596a73026054c3a8c2850faacf
         eb41b86f92a1a0108580fc20bb7c82bf
         ed82ec3ef427b740645c3fb1c17608ce
         d0da2cf0e946123be647fe6709efd6ae
         f76ebcc832a77cc9954a3cf166bd451b
         71a07db3624670b244fd3f6680c59718
         1d11a1f9f6d1651c1524212f92b0ebf6
         c50198596a73026054c3a8c2850faacf
         */
        
        
        self.datasource = DoublyLinkedList<UIImage>()
        print("BEFORE LOOP")
        let myGroup = DispatchGroup()
        ids.forEach { (id) in
            myGroup.enter()
            id.s3.download(imageExtension: .jpeg, completionHandler: { (image, path, err) in
                if err != nil {
                    print(err!)
                    myGroup.leave()
                } else {
//                    nscache["key"] = "image"
//                    cacheDataSource.setObject(image!, forKey: id as NSString)
                    self.datasource?.append(value: image!)
                    myGroup.leave()
                }
            })
        }
        myGroup.notify(queue: .main) {
            print("AFTER LOOP")
            self.totalImagesLength = self.ids.count
            self.totalImages.text = String(self.ids.count)
            completion()
        }
//        self.datasource?.append(value: UIImage(named: "space1")!)
//        self.datasource?.append(value: UIImage(named: "space2")!)
//        self.datasource?.append(value: UIImage(named: "world1")!)
//        self.datasource?.append(value: UIImage(named: "joke1")!)
//        self.datasource?.append(value: UIImage(named: "joke2")!)
//        self.datasource?.append(value: UIImage(named: "snowflake1")!)
//        self.datasource?.append(value: UIImage(named: "snowflake2")!)
    }
}

extension ViewController: NavigatorDelegate {
    func selectionChanged<T>(newValue: T) {
        self.imageView.image = newValue as? UIImage
    }
    
    func movedRight() {
//        totalImages.text = String(ids.count)
        if(Int(self.currentImage.text!)! < self.totalImagesLength-1)
        {
            self.currentImage.text = String(Int(self.currentImage.text!)! + 1)
        } else {
            self.currentImage.text = "0"
        }
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
//        if(Int(self.currentImage.text!)! < self.totalImagesLength-1)
//        {
//            self.currentImage.text = String(Int(self.currentImage.text!)! + 1)
//        } else {
//            self.currentImage.text = "0"
//        }
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

