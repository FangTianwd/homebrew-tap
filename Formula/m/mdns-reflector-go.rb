class MdnsReflectorGo < Formula
  desc "mDNS reflector for forwarding multicast DNS packets between network interfaces"
  homepage "https://github.com/FangTianwd/mdns_reflector_go"

  # For local development/testing - replace with actual release URL when publishing
  url "https://github.com/FangTianwd/mdns_reflector_go/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "fd97f64a995fe03312ebbfae8074e04ccc97dcc52d5491464fe62cc9f7d89bdc"

  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", "-o", bin/"mdns-reflector-go", "."
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
