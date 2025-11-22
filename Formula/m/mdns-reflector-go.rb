class MdnsReflectorGo < Formula
  desc "mDNS reflector for forwarding multicast DNS packets between network interfaces"
  homepage "https://github.com/FangTianwd/mdns_reflector_go"

  # 使用预编译二进制文件 - 无需本地编译，安装速度极快！
  url "https://github.com/FangTianwd/mdns_reflector_go/releases/download/v1.0.2/mdns-reflector-go-darwin-#{Hardware::CPU.arch}-1.0.2.tar.gz"
  if Hardware::CPU.arm?
    sha256 "e6dd507e8cb676019f9b6058253fcf7949637706ed2d66c569150df4c87c6e8f"
  else
    sha256 "26386f6e11a0c82710ccb65c4272e066f61c2c45d8c9bffe352a7baa37a35b12"
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
