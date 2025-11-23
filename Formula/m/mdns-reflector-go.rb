class MdnsReflectorGo < Formula
  desc "mDNS reflector for forwarding multicast DNS packets between network interfaces"
  homepage "https://github.com/FangTianwd/mdns_reflector_go"

  # 使用预编译二进制文件 - 无需本地编译，安装速度极快！
  url "https://github.com/FangTianwd/mdns_reflector_go/releases/download/v1.1.2/mdns-reflector-go-darwin-#{Hardware::CPU.arch}-v1.1.2.tar.gz"
  if Hardware::CPU.arm?
    sha256 "3e7b036121dec5f18f8d739021f2d6916016cc23ed83eeb8653da907e4c31be7"
  else
    sha256 "3719db31622b37a8be6e5bc6ad51c91a6bf1b64686bd98898d1adc041e429695"
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
