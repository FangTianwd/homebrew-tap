class MdnsReflectorGo < Formula
  desc "mDNS reflector for forwarding multicast DNS packets between network interfaces"
  homepage "https://github.com/FangTianwd/mdns_reflector_go"

  # 使用预编译二进制文件 - 无需本地编译，安装速度极快！
  url "https://github.com/FangTianwd/mdns_reflector_go/releases/download/v1.1.1/mdns-reflector-go-darwin-#{Hardware::CPU.arch}-v1.1.1.tar.gz"
  if Hardware::CPU.arm?
    sha256 "93b15b29ddcc0cf816da124b8fb49284a484fdfd1076d900c4e886aac73f5c99"
  else
    sha256 "d590e861d9c9b4e49198343a56c5cb44a7c2be024d38da34d8d299545d022401"
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
