class Serd < Formula
  desc "C library for RDF syntax"
  homepage "https://drobilla.net/software/serd/"
  url "https://download.drobilla.net/serd-0.30.10.tar.bz2"
  sha256 "affa80deec78921f86335e6fc3f18b80aefecf424f6a5755e9f2fa0eb0710edf"
  license "ISC"

  livecheck do
    url "https://download.drobilla.net/"
    regex(/href=.*?serd[._-]v?(\d+(?:\.\d+)+)\.t/i)
  end

  bottle do
    cellar :any
    sha256 "e28a02ac86a643e66e2d98fb2e22089f58071bd27faba353494ddc92f6823bfb" => :big_sur
    sha256 "10155eb151924f5fea4d02b197a5e08c5536340d9335329ce9d3dd6af3431a11" => :arm64_big_sur
    sha256 "b9b49fee3a281d23119785510ce19337a2eb9fea637583291651a44b27b4f15f" => :catalina
    sha256 "b780e951258475391de8618edc7915c5f10ea8286769537743d703ed51318778" => :mojave
  end

  depends_on "pkg-config" => :build

  def install
    system "./waf", "configure", "--prefix=#{prefix}"
    system "./waf"
    system "./waf", "install"
  end

  test do
    pipe_output("serdi -", "() a <http://example.org/List> .", 0)
  end
end
