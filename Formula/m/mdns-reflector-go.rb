class MdnsReflectorGo < Formula
  desc "mDNS reflector for forwarding multicast DNS packets between network interfaces"
  homepage "https://github.com/FangTianwd/mdns_reflector_go"

  # 使用预编译二进制文件 - 无需本地编译，安装速度极快！
  url "https://github.com/FangTianwd/mdns_reflector_go/releases/download/v1.2.0/mdns-reflector-go-darwin-#{Hardware::CPU.arch}-v1.2.0.tar.gz"
  if Hardware::CPU.arm?
    sha256 "e982c7e831a98e85a72ef02081e499286a3d607b2058b77870d445ab0538f185"
  else
    sha256 "2e796f29614518c2f692e77b1ebc4320e99d9cd05f3b1ae4e7766a91869aaf38"
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
