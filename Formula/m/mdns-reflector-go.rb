class MdnsReflectorGo < Formula
  desc "mDNS reflector for forwarding multicast DNS packets between network interfaces"
  homepage "https://github.com/FangTianwd/mdns_reflector_go"

  # 使用预编译二进制文件 - 无需本地编译，安装速度极快！
  url "https://github.com/FangTianwd/mdns_reflector_go/releases/download/v1.2.0/mdns-reflector-go-darwin-#{Hardware::CPU.arch}-v1.2.0.tar.gz"
  if Hardware::CPU.arm?
    sha256 "f26b148888fa5940a41cf7ae685611b06e38fd553dbca5fd2233e9b02f30997c"
  else
    sha256 "dacbacd2e6d9d2a8ae48097b324c8042784b38cf7d282176d7d544d7aa8b102c"
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
