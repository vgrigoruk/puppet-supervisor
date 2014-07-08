require 'formula'

class Supervisor < Formula
  resource 'setuptools' do
    url 'https://bitbucket.org/pypa/setuptools/get/1.1.4.tar.gz'
    sha1 'f5b306920869637bacdd04d01c2622dc34c7f68a'
  end

  resource 'meld3' do
    url 'https://github.com/Supervisor/meld3/archive/0.6.10.tar.gz'
    sha1 '4cf8d608dec33d18c4faa584cb2d69af8ea887d7'
  end

  homepage 'http://supervisord.org/'
  url 'https://github.com/Supervisor/supervisor/archive/3.0.tar.gz'
  sha1 '5b0976d699d6a2b1ca32f8f07e1257c1e8af42e2'

  head 'https://github.com/Supervisor/supervisor.git', :branch => :master

  depends_on :python

  def patches
    # adds MANIFEST.in file to include needed files.
    #DATA
  end

  plist_options :manual => "supervisord"

  def plist; <<-EOS.undent
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
    <dict>
      <key>Label</key>
      <string>#{plist_name}</string>
      <key>ProgramArguments</key>
      <array>
        <string>#{bin}/supervisord</string>
        <string>-n</string>
        <string>-c</string>
        <string>#{etc}/supervisord.conf</string>
      </array>
      <key>RunAtLoad</key>
      <true/>
      <key>KeepAlive</key>
      <dict>
          <key>SuccessfulExit</key>
          <false/>
      </dict>
      <key>WorkingDirectory</key>
      <string>#{HOMEBREW_PREFIX}</string>
    </dict>
    </plist>
    EOS
  end

  def install
    install_args = [ "setup.py", "install", "--prefix=#{libexec}" ]

    python do
      resource("setuptools").stage { system "python", *install_args }
      resource("meld3").stage { system "python", *install_args }

      system "python", "setup.py", "install", "--prefix=#{prefix}",
                                            "--single-version-externally-managed",
                                            "--record=installed.txt"
    end
  end
end