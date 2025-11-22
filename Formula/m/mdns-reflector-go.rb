class MdnsReflectorGo < Formula
  desc "mDNS reflector for forwarding multicast DNS packets between network interfaces"
  homepage "https://github.com/FangTianwd/mdns-reflector-go"
  url "file:///Users/jiangshengcheng/mdns_reflector_go"
  sha256 :no_check
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
