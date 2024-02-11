import UIKit

final class ImagesListCell: UITableViewCell {
    static let reuseIdentifier = "ImagesListCell"
    @IBOutlet var cellImage: UIImageView!
    @IBOutlet var cellData: UILabel!
    @IBOutlet var cellButton: UIButton!
}
extension UILabel {
    func addGradientToText(colors: [UIColor], startPoint: CGPoint, endPoint: CGPoint) {
        // Создаем градиентный слой для текста
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = colors.map { $0.cgColor }
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint

        // Создаем маску для градиентного слоя
        UIGraphicsBeginImageContextWithOptions(bounds.size, false, UIScreen.main.scale)
        defer { UIGraphicsEndImageContext() }
        guard let context = UIGraphicsGetCurrentContext() else { return }
        layer.render(in: context)
        let maskImage = UIGraphicsGetImageFromCurrentImageContext()?.cgImage
        let maskLayer = CALayer()
        maskLayer.frame = bounds
        maskLayer.contents = maskImage
        gradientLayer.mask = maskLayer

        // Добавляем градиентный слой к слою текста
        layer.addSublayer(gradientLayer)
    }
}
