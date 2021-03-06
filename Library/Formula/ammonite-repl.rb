class AmmoniteRepl < Formula
  desc "Ammonite is a cleanroom re-implementation of the Scala REPL"
  homepage "https://lihaoyi.github.io/Ammonite/#Ammonite-REPL"
  url "https://github.com/lihaoyi/Ammonite/archive/0.5.0.tar.gz"
  sha256 "302a90c229df39badc623b5bbb4e7ac3530e7f5cc5b62b72d375d90b05d75bbc"

  bottle do
    cellar :any_skip_relocation
    sha256 "12e78b67e23fc788271414f1cddc9c324598072e5412aa5279892bdd0be448da" => :el_capitan
    sha256 "93498007184d56b7106be5e30c2982909d35caa32305fbac49b0afd85da9e7d3" => :yosemite
    sha256 "5939b0268a1d751507a74b3d8c51f20243e7120cdcd129da866d8a2c8b7e7b01" => :mavericks
  end

  depends_on :java => "1.6+"
  depends_on "sbt" => :build

  def install
    ENV["_JAVA_OPTIONS"] = "-Duser.home=#{buildpath}"
    system "sbt", "repl/assembly"
    bin.install "repl/target/scala-2.11/ammonite-repl-0.5.0-2.11.7" => "amm"
  end

  test do
    ENV["_JAVA_OPTIONS"] = "-Duser.home=#{testpath}"
    assert_equal "hello world!", shell_output("#{bin}/amm -c 'print(\"hello world!\")'")
  end
end
