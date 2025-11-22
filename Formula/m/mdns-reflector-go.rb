class MdnsReflectorGo < Formula
  desc "mDNS reflector for forwarding multicast DNS packets between network interfaces"
  homepage "https://github.com/FangTianwd/mdns_reflector_go"

  # 使用预编译二进制文件 - 无需本地编译，安装速度极快！
  url "https://github.com/FangTianwd/mdns_reflector_go/releases/download/v1.0.2/mdns-reflector-go-darwin-#{Hardware::CPU.arch}-v1.0.2.tar.gz"
  if Hardware::CPU.arm?
    sha256 "827804295c7babbc0a55d4439d71742ccf783b77a019fe20b994280c41e24ba3"
  else
    sha256 "3a83991860d748268af01b79e2e61beaa386170322df4115f50e3f5e4b9506ca"
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
