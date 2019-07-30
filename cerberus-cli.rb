class CerberusCli < Formula
  desc "A CLI for the Cerberus API."
  homepage "http://engineering.nike.com/cerberus"
  url "https://github.com/Nike-Inc/cerberus-cli/releases/download/v0.8.1/cerberus-cli-darwin-amd64"
  sha256 "e8a32d3da58f9c3a8fa0a2162334ad3d83c8fee3c517b9f189202375ee98083d"
  version "v0.8.1"

  resource "additional_files" do
    url "https://github.com/Nike-Inc/cerberus-cli/archive/v0.8.1.tar.gz"
    sha256 "c8ae0234600021fa4c60a2a9be7fe8c149315dd32f8b452f9a078d651a1398b9"
  end

  option "with-completion"

  def install
    bin.install "cerberus-cli-darwin-amd64" => "cerberus"
    if build.with? "completion"
      lib.mkpath
      resource("additional_files").stage {
        mv "cerberus-completion.sh", "#{lib}/cerberus"
        ln_s "#{lib}/cerberus", "#{etc}/bash_completion.d/cerberus", force: true
      }
    end
  end

  test do
    system "#{bin}/cerberus", "help"
  end
end
