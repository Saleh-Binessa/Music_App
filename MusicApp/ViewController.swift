import UIKit
import SnapKit

class ViewController: UIViewController {

    let albumCoverImageView = UIImageView()
    let artistLabel = UILabel()
    let titleLabel = UILabel()
    let currentTimeLabel = UILabel()
    let remainingTimeLabel = UILabel()
    
    let progressBar = UISlider()
    
    let playPauseButton = UIButton()
    let nextTrackButton = UIButton()
    let previousTrackButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()
    }

    func setupAlbumImageView() {
        view.addSubview(albumCoverImageView)
        albumCoverImageView.contentMode = .scaleAspectFill
        albumCoverImageView.image = UIImage(named: "albumImage")
    }
    
    func setupUI() {
        setupAlbumImageView()
        setupLabels()
        setupProgressBar()
        setupControlButtons()
    }

    func setupLabels() {
        view.addSubview(titleLabel)
        titleLabel.text = "Francesco di Mauro"
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24)

        view.addSubview(artistLabel)
        artistLabel.text = "Bella Giornata"
        artistLabel.textAlignment = .center
        artistLabel.font = UIFont.systemFont(ofSize: 18)
    }

    func setupControlButtons() {
        view.addSubview(playPauseButton)
        playPauseButton.setImage(UIImage(systemName: "play.fill"), for: .normal)

        view.addSubview(nextTrackButton)
        nextTrackButton.setImage(UIImage(systemName: "forward.fill"), for: .normal)

        view.addSubview(previousTrackButton)
        previousTrackButton.setImage(UIImage(systemName: "backward.fill"), for: .normal)
    }

    func setupProgressBar() {
        view.addSubview(progressBar)
        progressBar.snp.makeConstraints { make in
            make.top.equalTo(artistLabel.snp.bottom).offset(20)
            make.left.right.equalToSuperview().inset(20)
        }

        view.addSubview(currentTimeLabel)
        currentTimeLabel.text = "0:00"

        view.addSubview(remainingTimeLabel)
        remainingTimeLabel.text = "-4:30"
    }
    
    func setupConstraints() {

        albumCoverImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-100)
            make.width.equalToSuperview().multipliedBy(0.5)
            make.height.equalTo(albumCoverImageView.snp.width)
        }

        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(albumCoverImageView.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
            make.left.right.equalToSuperview().inset(20)
        }

        artistLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
            make.left.right.equalToSuperview().inset(20)
        }

        progressBar.snp.makeConstraints { make in
            make.top.equalTo(artistLabel.snp.bottom).offset(20)
            make.left.right.equalToSuperview().inset(20)
        }

        currentTimeLabel.snp.makeConstraints { make in
            make.top.equalTo(progressBar.snp.bottom).offset(8)
            make.left.equalTo(progressBar.snp.left)
        }

        remainingTimeLabel.snp.makeConstraints { make in
            make.top.equalTo(progressBar.snp.bottom).offset(8)
            make.right.equalTo(progressBar.snp.right)
        }

        playPauseButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(currentTimeLabel.snp.bottom).offset(20)
        }

        nextTrackButton.snp.makeConstraints { make in
            make.centerY.equalTo(playPauseButton.snp.centerY)
            make.left.equalTo(playPauseButton.snp.right).offset(30)
        }

        previousTrackButton.snp.makeConstraints { make in
            make.centerY.equalTo(playPauseButton.snp.centerY)
            make.right.equalTo(playPauseButton.snp.left).offset(-30)
        }
    }
}
