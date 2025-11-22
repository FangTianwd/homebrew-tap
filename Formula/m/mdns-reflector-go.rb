class MdnsReflectorGo < Formula
  desc "mDNS reflector for forwarding multicast DNS packets between network interfaces"
  homepage "https://github.com/FangTianwd/mdns_reflector_go"

  # 使用预编译二进制文件 - 无需本地编译，安装速度极快！
  url "https://github.com/FangTianwd/mdns_reflector_go/releases/download/v1.0.2/mdns-reflector-go-darwin-#{Hardware::CPU.arch}-1.0.2.tar.gz"
  sha256 arm64: "e766899d038da1caeaec7693c35a4108cf76ca331da269c663b59ed8ddb7a2a6",
         intel: "e766899d038da1caeaec7693c35a4108cf76ca331da269c663b59ed8ddb7a2a6"

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
