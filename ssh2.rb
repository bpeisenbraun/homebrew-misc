require "formula"

class Ssh2 < Formula
  homepage "http://fossies.org/linux/misc/old/ssh-3.2.9.1.tar.gz/"
  url "http://fossies.org/linux/misc/old/ssh-3.2.9.1.tar.gz"
  sha1 "22e4589c889aef18e53a8942716084f0d8ede7db"

  # Don't clean the 32-bit compilation variables
  env :std

  def install
    # Force 32-bit compilation
    ENV['CFLAGS']='-arch i386'
    ENV['LDFLAGS']='-arch i386'
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

  def caveats; <<-EOS.undent
    This formula will install SSH.COM binaries and man pages for the 
    following: ssh2, scp2, sftp2, ssh-agent2, ssh-keygen2 and ssh-add2.

    The ssh2_config man page has information on configuration options, and 
    enabling the ssh-agent2 process in your shell is left as an exercise for
    the user.
    EOS
  end
end
