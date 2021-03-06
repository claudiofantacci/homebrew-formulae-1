class RobotTesting < Formula
  desc "Robot Testing Framework (RTF)"
  homepage "https://robotology.github.io/robot-testing/index.html"

  stable do
    url "https://github.com/robotology/robot-testing/archive/v1.2.0.tar.gz"
    sha256 "d5147e190647b576c0219759467dfc7663a8262672cb8ef5209a7c455488b2e4"
  end

  bottle do
    root_url "https://github.com/robotology/robot-testing/releases/download/v1.2.0"
    cellar :any
    sha256 "760b71849b83ab2f9075aef4df9594521373ece5863421ea5f3e693e1358bdf3" => :sierra
    sha256 "91775498ec5723bfd819e6d9cbddbc6b3796df98be131f172a84c6dd1edfc0e6" => :el_capitan
  end

  head do
    url "https://github.com/robotology/robot-testing.git", :branch => "master"
  end

  depends_on "cmake" => :build

  depends_on "python" => :optional
  depends_on "lua" => :optional

  def install
    args = std_cmake_args + %w[
      -DENABLE_RUBY_PLUGIN:BOOL=ON
    ]

    args << "-DENABLE_LUA_PLUGIN:BOOL=ON" if build.with? "lua"
    args << "-DENABLE_PYTHON_PLUGIN:BOOL=ON" if build.with? "python"

    system "cmake", *args
    system "make", "install"
  end

  test do
  end
end
