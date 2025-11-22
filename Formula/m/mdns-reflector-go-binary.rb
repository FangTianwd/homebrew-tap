class MdnsReflectorGoBinary < Formula
  desc "mDNS reflector for forwarding multicast DNS packets between network interfaces"
  homepage "https://github.com/FangTianwd/mdns_reflector_go"

  # 使用预编译二进制文件（需要根据实际 SHA256 更新）
  url "https://github.com/FangTianwd/mdns_reflector_go/releases/download/v1.0.1/mdns-reflector-go-darwin-#{Hardware::CPU.arch}-1.0.1.tar.gz"
  sha256 arm64:  "UPDATE_WITH_ACTUAL_SHA256_FOR_ARM64",
         intel:  "UPDATE_WITH_ACTUAL_SHA256_FOR_AMD64"

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
