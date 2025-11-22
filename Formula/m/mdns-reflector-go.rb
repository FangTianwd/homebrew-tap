class MdnsReflectorGo < Formula
  desc "mDNS reflector for forwarding multicast DNS packets between network interfaces"
  homepage "https://github.com/FangTianwd/mdns_reflector_go"

  # 使用预编译二进制文件 - 无需本地编译，安装速度极快！
  url "https://github.com/FangTianwd/mdns_reflector_go/releases/download/v1.0.4/mdns-reflector-go-darwin-#{Hardware::CPU.arch}-v1.0.4.tar.gz"
  if Hardware::CPU.arm?
    sha256 "1e30eedf68667cac349018f001bddd278956473665f585859346f4b134ff04f6"
  else
    sha256 "90cc687b471d8ab7afc23edf4efcf10743fdeebf9910952d42586d1e13315a08"
  end

  license "MIT"

  def install
    bin.install "mdns-reflector-go"
  end

  service do
    run [opt_bin/"mdns-reflector-go"]
    keep_alive true
    log_path var/"log/mdns-reflector-go.log"
    error_log_path var/"log/mdns-reflector-go-error.log"
  end

  test do
    system "#{bin}/mdns-reflector-go", "--help"
  end
end
