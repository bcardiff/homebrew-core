class GitRemoteGcrypt < Formula
  desc "GPG-encrypted git remotes"
  homepage "https://spwhitton.name/tech/code/git-remote-gcrypt/"
  url "https://github.com/spwhitton/git-remote-gcrypt/archive/1.4.tar.gz"
  sha256 "12567395bbbec0720d20ec0f89f6f54a7fae4cafedab0fc917164f0deb6b1ef5"
  license "GPL-3.0"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    cellar :any_skip_relocation
    sha256 "348795646f446bef6471630348162d3d4ea09e2cee5f71405bdb2da5ab936eac" => :big_sur
    sha256 "2a504a2fd03734bd408fcbf085e2ffb190bdcd7752f130a6f1affd850354a85d" => :arm64_big_sur
    sha256 "422197237a410ce36132a62aa25d15419a5a88e60affc63ceb2926f7bddacf03" => :catalina
    sha256 "a8ac84fcad96a05d2846adf010eba868703b7d3732c25c2da8a103e6780624fe" => :mojave
  end

  depends_on "docutils" => :build

  def install
    ENV["prefix"] = prefix
    system "./install.sh"
  end

  test do
    assert_match("fetch\npush\n", pipe_output("#{bin}/git-remote-gcrypt", "capabilities\n", 0))
  end
end
