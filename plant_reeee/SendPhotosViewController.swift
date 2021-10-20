
import UIKit
import FirebaseStorage
import MobileCoreServices

class SendPhotosViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let alert = UIAlertController(title: "Send photos", message: "This app uses machine learning, which is very data hungry. Sending raw photos can help us train our model and make it even more accurate, improving the experience for all users. Of course, you are not obliged to send any photos.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true)
        guard let urlString = UserDefaults.standard.value(forKey: "url") as? String,
            let url = URL(string:urlString) else {
                return
        }
        URLSession.shared.dataTask(with: url, completionHandler: {data, _, error in
            guard let data = data, error == nil else {
                return
            }
            DispatchQueue.main.async {
                let image = UIImage(data: data)
            }
            
        })
    }
    // Code below is from https://www.youtube.com/watch?v=TAF6cPZxmmI
    
    private let storage = Storage.storage().reference()

//    let imagePicker = UIImagePickerController()
    
    @IBAction func sendPhoto(_ sender: Any) {
//        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum) {
//            imagePicker.delegate = self
//            imagePicker.sourceType = .savedPhotosAlbum
//            imagePicker.allowsEditing = true
//            //imagePicker.sourceType = .camera
//            print(imagePicker)
//            present(imagePicker, animated: true, completion: nil)
//
//            let uploadRef = Storage.storage().reference()
//
//        }
        let picker = UIImagePickerController()
        picker.sourceType = .savedPhotosAlbum
        picker.delegate = self
        picker.allowsEditing = true
        present(picker, animated: true)


    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        guard let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else {
            return
        }
        guard let imageData = image.pngData() else {
            return
        }
        storage.child("images/file.png").putData(imageData, metadata: nil, completion: {_, error in
        guard error == nil else {
            print("failed to upload")
            return
            }
            self.storage.child("images/file.png").downloadURL(completion: {url, error in
                guard let url = url, error == nil else {
                    return
                }
                let urlString = url.absoluteURL
                print(urlString)
                UserDefaults.standard.set(urlString, forKey: "url")
            })
        })
        
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    
}

//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
////        let pickedImage = info[.originalImage] as? UIImage
////        self.dismiss(animated: true)
//        let mediaType = info[UIImagePickerController.InfoKey.mediaType] as! CFString
//        if mediaType == kUTTypeImage {
//          let imageURL = info[UIImagePickerController.InfoKey.imageURL] as! URL
//          // Handle your logic here, e.g. uploading file to Cloud Storage for Firebase
//        }
//        picker.dismiss(animated: true, completion: nil)
//
//    }
