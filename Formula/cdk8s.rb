require "language/node"

class Cdk8s < Formula
  desc "Define k8s native apps and abstractions using object-oriented programming"
  homepage "https://cdk8s.io/"
  url "https://registry.npmjs.org/cdk8s-cli/-/cdk8s-cli-1.0.156.tgz"
  sha256 "8895ddca37d4f903f48543f15ae585759f31ec1732b0e0ae6a1353061fc0ba6d"
  license "Apache-2.0"

  bottle do
    sha256 cellar: :any_skip_relocation, all: "3aea3992e5be6c6a6da8a27f115cf85b20787cfa033ef8138ca8068434d69c0b"
  end

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match "Cannot initialize a project in a non-empty directory",
      shell_output("#{bin}/cdk8s init python-app 2>&1", 1)
  end
end
