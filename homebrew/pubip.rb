require 'rbconfig'
class Pubip < Formula
  desc ""
  homepage "https://github.com/kaminey/pubip"
  version "0.0.1"

  if Hardware::CPU.is_64_bit?
    case RbConfig::CONFIG['host_os']
    when /mswin|msys|mingw|cygwin|bccwin|wince|emc/
      :windows
    when /darwin|mac os/
      url "https://github.com/kaminey/pubip/releases/download/v0.0.1/pubip_0.0.1_darwin_amd64.zip"
      sha256 "99b09cf062e7c451583980654379ef7228d8f653a4072320b3003a3cd998b3dc"
    when /linux/
      url "https://github.com/kaminey/pubip/releases/download/v0.0.1/pubip_0.0.1_linux_amd64.tar.gz"
      sha256 "3d0c3d7a9915136f9d5a5beb6aed5d059766f5097b4c80351b3639730923b0d9"
    when /solaris|bsd/
      :unix
    else
      :unknown
    end
  else
    case RbConfig::CONFIG['host_os']
    when /mswin|msys|mingw|cygwin|bccwin|wince|emc/
      :windows
    when /darwin|mac os/
      url "https://github.com/kaminey/pubip/releases/download/v0.0.1/pubip_0.0.1_darwin_386.zip"
      sha256 "df578d4cee9b655468a5901b8fa77deda128187848a38e9a3a138449815386c3"
    when /linux/
      url "https://github.com/kaminey/pubip/releases/download/v0.0.1/pubip_0.0.1_linux_386.tar.gz"
      sha256 "773668732c0da926dc9fff4309b7bc0c3468b43690580a3b8533c8f59eaf08a1"
    when /solaris|bsd/
      :unix
    else
      :unknown
    end
  end

  def install
    bin.install "pubip"
  end

  test do
    system "pubip"
  end

end
