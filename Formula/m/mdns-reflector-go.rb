class MdnsReflectorGo < Formula
  desc "mDNS reflector for forwarding multicast DNS packets between network interfaces"
  homepage "https://github.com/FangTianwd/mdns_reflector_go"

  # 使用预编译二进制文件 - 无需本地编译，安装速度极快！
  url "https://github.com/FangTianwd/mdns_reflector_go/releases/download/v1.0.4/mdns-reflector-go-darwin-#{Hardware::CPU.arch}-v1.0.4.tar.gz"
  if Hardware::CPU.arm?
    sha256 "aba7cea65e809155009b99a8ae11b858078a2cb4cad66a2b40e8f7660dedf015"
  else
    sha256 "5ede0cb06dfb112d9ad0060197726d34f49e14f72dc720ca2b819183fce56021"
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
