class Fswatch < Formula
  desc "Monitor a directory for changes and run a shell command"
  homepage "https://github.com/emcrisostomo/fswatch"
  url "https://github.com/emcrisostomo/fswatch/releases/download/1.14.0/fswatch-1.14.0.tar.gz"
  sha256 "44d5707adc0e46d901ba95a5dc35c5cc282bd6f331fcf9dbf9fad4af0ed5b29d"

  bottle do
    cellar :any
    sha256 "3717cd4f32abd016ff688eb29c6edcb1558b0717b0ff4ede6c3480c245c237e2" => :catalina
    sha256 "7310f4dbbbdeed582cb713b3d08bf982553747cbda75eb76d2dfe00f309ed3f7" => :mojave
    sha256 "68cfeb10ae04d00cc90e0d87d48a61c7c22b38f386410dbf2eb6c004200ddc8a" => :high_sierra
    sha256 "9362bc3b3321bf0238fa70d2f2825e4118e18deb2207af3a2633b6772bb33666" => :sierra
  end

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "gettext" => :build
  depends_on "libtool" => :build

  # Integrate with pkg-config
  patch :p1 do
    url "https://github.com/emcrisostomo/fswatch/commit/2d97a7661fa82c57a21873d7ec4435c3e4db76e3.patch?full_index=1"
    sha256 "3a135e07610ed35c9edbb8a6009204dd0dc0f4ff6913cba30debee170cf1fa99"
  end

  def install
    ENV.cxx11
    ENV["CONFIG_SHELL"] = "/bin/bash"
    system "autoreconf", "--install"
    system "./configure", "CONFIG_SHELL=/bin/bash",
                          "--prefix=#{prefix}",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules"
    system "make", "install"
  end

  test do
    system bin/"fswatch", "-h"
  end
end
