class Unsign < Formula
  desc "A command line tool to unsign Xcode"
  homepage "https://github.com/phynet/unsign-xcode"
  url "https://github.com/janopoq/unsign-xcode/raw/master/unsign.tgz"
  sha256 "5e134d6884fe956f5aeb632ff724bbe368534e6a171f258a6855e451f0dfe5a1" 
  version "1.0.0"
  needs :cxx11
  depends_on :xcode => :build
  bottle do
      cellar :any
      sha256 "6677ae0354d2ab5ec304034655ccb2db6bda98b6b2da2b257ebe14f4aa88f366" => :high_sierra
      sha256 "cafebabe" => :sierra
      sha256 "cafebabe" => :el_capitan
    end
  def install
    bin.write_exec_script (libexec/"unsign-xcode.sh")
    system "make"
    bin.install "unsign"
  end
  test do
    output = shell_output("#{bin}/unsign-xcode")
    assert_match "This command", output
  end
end
