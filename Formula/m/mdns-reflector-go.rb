class MdnsReflectorGo < Formula
  desc "mDNS reflector for forwarding multicast DNS packets between network interfaces"
  homepage "https://github.com/FangTianwd/mdns_reflector_go"

  # 使用预编译二进制文件 - 无需本地编译，安装速度极快！
  url "https://github.com/FangTianwd/mdns_reflector_go/releases/download/v1.1.0/mdns-reflector-go-darwin-#{Hardware::CPU.arch}-v1.1.0.tar.gz"
  if Hardware::CPU.arm?
    sha256 "00d3adcae7f66fe89fbcb920ddcfffc40b7c7f3b18f13fe1adedff0fabd02f90"
  else
    sha256 "00d3adcae7f66fe89fbcb920ddcfffc40b7c7f3b18f13fe1adedff0fabd02f90"
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
