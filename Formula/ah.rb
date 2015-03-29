require "formula"
require "tempfile"
require "fileutils"


class Ah < Formula
  homepage "https://github.com/9seconds/ah"
  url "https://github.com/9seconds/ah.git", :tag => "0.14.2"
  version "0.14.2"
  sha1 ""

  bottle do
    sha1 "7563b28df830baa880731b9448e88b99dcb68420" => :mavericks
    sha1 "4ecba686ae851cb091bec58aebab1c092a5edfbf" => :mountain_lion
    sha1 "697f44626b6dd3152fb23d6da8272cb2359a6845" => :lion
  end

  depends_on "go" => :build

  def install
    Dir.mktmpdir("ah") do |dir|
      ENV["GOPATH"] = dir

      FileUtils.mkdir_p "#{dir}/src/github.com/9seconds"
      File.symlink(Dir.pwd, "#{dir}/src/github.com/9seconds/ah")

      system "go", "get", "github.com/tools/godep"
      system "make prog-build"
    end
    bin.install "ah"
  end

  test do
    system "#{bin}/ah", "--version"
  end
end
