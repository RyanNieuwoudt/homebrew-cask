cask "photosrevive" do
  version "2.1.0,aa3d20be-fb7a-4714-ad4c-0a447838e067"
  sha256 "1ca8f66e25702dbf5fd4fbe75b9d8964cd77705d3a57d01d193051139caae02d"

  url "https://neededapps.nyc3.digitaloceanspaces.com/media/public/#{version.csv.second}.zip",
      verified: "neededapps.nyc3.digitaloceanspaces.com/media/public/"
  name "PhotosRevive"
  desc "Colorise old black and white photos automatically"
  homepage "https://neededapps.com/photosrevive/"

  livecheck do
    url "https://neededapps.com/appcasts/photosrevive/changelog.xml"
    strategy :sparkle do |item|
      hex = item.url[%r{/([\h-]+)\.zip}i, 1]
      next if hex.blank?

      "#{item.short_version},#{hex}"
    end
  end

  depends_on macos: ">= :big_sur"

  app "PhotosRevive.app"

  zap trash: [
    "~/Library/Application Support/PhotosRevive",
    "~/Library/Caches/com.jeremyvizzini.photosrevive.macos",
    "~/Library/Preferences/com.jeremyvizzini.photosrevive.macos.plist",
    "~/Library/Saved Application State/com.jeremyvizzini.photosrevive.macos.savedState",
  ]
end
