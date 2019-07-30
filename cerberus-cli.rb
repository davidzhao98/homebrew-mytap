class CerberusCli < Formula
  desc "A CLI for the Cerberus API."
  homepage "http://engineering.nike.com/cerberus"
  url "https://github.com/Nike-Inc/cerberus-cli/releases/download/v0.8.2/cerberus-cli-darwin-amd64"
  sha256 "4895a12b2e7df0465bb07d69e2e22b64f5c9800cc654bdd56da2832a01d89e5c"
  version "v0.8.2"

  resource "additional_files" do
    url "https://github.com/Nike-Inc/cerberus-cli/archive/v0.8.2.tar.gz"
    sha256 "ea63d449e72aad5b8e68d30c6b28b095a77a158a60fb8333c94ebe21f1e5d478"
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
