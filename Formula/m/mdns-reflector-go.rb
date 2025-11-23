class MdnsReflectorGo < Formula
  desc "mDNS reflector for forwarding multicast DNS packets between network interfaces"
  homepage "https://github.com/FangTianwd/mdns_reflector_go"

  # 使用预编译二进制文件 - 无需本地编译，安装速度极快！
  url "https://github.com/FangTianwd/mdns_reflector_go/releases/download/v1.2.0/mdns-reflector-go-darwin-#{Hardware::CPU.arch}-v1.2.0.tar.gz"
  if Hardware::CPU.arm?
    sha256 "cf13adc592b5a1d38a79ba79dd08f3121a6832a3296d1634dd0329ff7af554ae"
  else
    sha256 "0e078961475d1cad921b2ea67bdded30867f8b66f4607c2720f461ce883cc4f4"
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
