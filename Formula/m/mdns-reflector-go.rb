class MdnsReflectorGo < Formula
  desc "mDNS reflector for forwarding multicast DNS packets between network interfaces"
  homepage "https://github.com/FangTianwd/mdns_reflector_go"

  url "https://github.com/FangTianwd/mdns_reflector_go/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "1679fc207f8202d3bde7126380a211357ac8a53ba7f0bc2e16af29f8159f45f0"

  license "MIT"

  depends_on "go" => :build

  def install
    # 使用 Go 代理加速依赖下载
    ENV["GOPROXY"] = "https://goproxy.cn,direct"
    system "go", "build", "-ldflags", "-s -w", "-o", bin/"mdns-reflector-go", "."
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
