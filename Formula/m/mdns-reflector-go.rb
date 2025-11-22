class MdnsReflectorGo < Formula
  desc "mDNS reflector for forwarding multicast DNS packets between network interfaces"
  homepage "https://github.com/FangTianwd/mdns_reflector_go"

  # 使用预编译二进制文件 - 无需本地编译，安装速度极快！
  url "https://github.com/FangTianwd/mdns_reflector_go/releases/download/v1.0.3/mdns-reflector-go-darwin-#{Hardware::CPU.arch}-v1.0.3.tar.gz"
  if Hardware::CPU.arm?
    sha256 "437b74509784ee85518b42c9add37a9c0508d0edbf950b1dd987cf3e8e19dec2"
  else
    sha256 "d6e70013637739a754b01f2cb48efa49144d60e212d373cff125f5b56e3553af"
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
