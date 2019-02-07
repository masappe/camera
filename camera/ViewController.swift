//
//  ViewController.swift
//  camera
//
//  Created by 早川雅人 on 2019/01/22.
//  Copyright © 2019 早川雅人. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate{

    @IBOutlet weak var imageview: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    //アルバムの閲覧
    @IBAction func Album(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
            
            let picker = UIImagePickerController()
            
            picker.sourceType = .photoLibrary
            //画像の編集を行う
            picker.allowsEditing = true
            picker.delegate = self
            present(picker, animated: true, completion: nil)
        }
    }
    //写真の選択，撮影が終わったら呼ばれる
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        imageview.image = image
        picker.dismiss(animated: true, completion: nil)
    }
    //カメラ撮影
    @IBAction func Camera(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            let picker = UIImagePickerController()
            picker.sourceType = .camera
            //画像の編集を行う
            picker.allowsEditing = true
            picker.delegate = self
            present(picker, animated: true, completion: nil)
        }
    }
    
    
}

