import UIKit

protocol InputTextDelegate: AnyObject {
    func saveTextAndReturn(fruitsName: String)
}

class InputTextViewController: UIViewController {
    @IBOutlet weak private var inputTextField: UITextField!

    weak var delegate: InputTextDelegate?

    private func presentAlert(message: String) {
        let alert = UIAlertController(
            title: "警告",
            message: message,
            preferredStyle: .alert
        )

        alert.addAction(
            UIAlertAction(
                title: "OK",
                style: .default,
                handler: nil)
        )
        present(alert, animated: true, completion: nil)
    }

    @IBAction private func saveTextButton(_ sender: Any) {
        guard let inputText = inputTextField.text, !inputText.isEmpty else {
            presentAlert(message: "名前を入力してください。")
            return
        }
        delegate?.saveTextAndReturn(fruitsName: inputText)
    }
}
