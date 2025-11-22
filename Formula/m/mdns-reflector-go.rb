class MdnsReflectorGo < Formula
  desc "mDNS reflector for forwarding multicast DNS packets between network interfaces"
  homepage "https://github.com/FangTianwd/mdns_reflector_go"

  # 使用预编译二进制文件 - 无需本地编译，安装速度极快！
  url "https://github.com/FangTianwd/mdns_reflector_go/releases/download/v1.0.2/mdns-reflector-go-darwin-#{Hardware::CPU.arch}-1.0.2.tar.gz"
  if Hardware::CPU.arm?
    sha256 "e31ac8c0d15f6c13e2a9d2e6aa1a4234c9680681731f33f9ecf4ab31ea8a1f8f"
  else
    sha256 "PLACEHOLDER_SHA256_FOR_INTEL"  # 需要 Intel 二进制文件
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
