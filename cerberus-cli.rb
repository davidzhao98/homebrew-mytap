class CerberusCli < Formula
  desc "A CLI for the Cerberus API."
  homepage "http://engineering.nike.com/cerberus"
  url "https://github.com/Nike-Inc/cerberus-cli/releases/download/v0.8.2/cerberus-cli-darwin-amd64"
  sha256 "e8a32d3da58f9c3a8fa0a2162334ad3d83c8fee3c517b9f189202375ee98083d"
  version "v0.8.2"

  resource "additional_files" do
    url "https://github.com/Nike-Inc/cerberus-cli/archive/v0.8.2.tar.gz"
    sha256 "06a9b13580a332c38bf365137ad15af8494e4dd988b9209a13901e50017cff2e"
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
