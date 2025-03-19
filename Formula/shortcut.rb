class Shortcut < Formula
  desc 'A CLI tool enhancing your terminal usage by allowing you to save your most used commands/scripts and then executing them in no time.  '
  homepage 'https://github.com/babilonczyk/shortcut'
  url 'https://github.com/babilonczyk/shortcut/archive/1.0.0.tar.gz'
  sha256 'cc50cab1259c44aa7d0dcd9c00d5ea5ee1fac0dee18eaa2cad3f50e8af9969b2'

  depends_on 'ruby'

  def install
    ENV['GEM_HOME'] = libexec
    ENV['GEM_PATH'] = "#{libexec}:#{Gem.dir}"

    system 'gem', 'install', 'bundler', '--no-document'
    system 'bundle', 'config', 'set', '--local', 'path', 'vendor/bundle'
    system 'bundle', 'install'

    # Explicitly install required gems
    system 'gem', 'install', 'rainbow'
    system 'gem', 'install', 'thor'

    system 'gem', 'build', 'shortcut.gemspec'
    system 'gem', 'install', '--ignore-dependencies', "shortcut-#{version}.gem"

    bin.install libexec / 'bin' / 'shortcut'
    bin.env_script_all_files(libexec / 'bin', GEM_HOME: ENV['GEM_HOME'], GEM_PATH: ENV['GEM_PATH'])

    bin.install_symlink bin / 'shortcut' => 'sc'
  end

  test do
    system 'shortcut', '--version'
    system 'sc', '--version'
  end
end
