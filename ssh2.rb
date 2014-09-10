require "formula"

class Ssh2 < Formula
  homepage "http://fossies.org/linux/misc/old/ssh-3.2.9.1.tar.gz/"
  url "http://fossies.org/linux/misc/old/ssh-3.2.9.1.tar.gz"
  sha1 "22e4589c889aef18e53a8942716084f0d8ede7db"

  def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--with-foreign-etcdir=#{prefix}/etc",
                          "--prefix=#{prefix}"
    system "make"
    bin.install "apps/ssh/ssh2", "apps/ssh/scp2", "apps/ssh/sftp2", 
                "apps/ssh/ssh-agent2", "apps/ssh/ssh-keygen2", 
                "apps/ssh/ssh-add2"

    man1.install "apps/ssh/ssh2.1", "apps/ssh/scp2.1", "apps/ssh/sftp2.1",
                 "apps/ssh/ssh-agent2.1", "apps/ssh/ssh-keygen2.1",
                 "apps/ssh/ssh-add2.1"
    man5.install "apps/ssh/ssh2_config.5"
          
  end
end
