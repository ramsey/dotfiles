require 'rake'
require 'erb'
require 'net/http'

desc "install the dot files into user's home directory"
task :install do
  replace_all = false
  Dir['*'].each do |file|
    next if %w[Rakefile README.md].include? file

    if File.exist?(File.join(ENV['HOME'], ".#{file.sub('.erb', '')}"))
      if File.identical? file, File.join(ENV['HOME'], ".#{file.sub('.erb', '')}")
        puts "identical ~/.#{file.sub('.erb', '')}"
      elsif replace_all
        replace_file(file)
      else
        print "overwrite ~/.#{file.sub('.erb', '')}? [ynaq] "
        case $stdin.gets.chomp
        when 'a'
          replace_all = true
          replace_file(file)
        when 'y'
          replace_file(file)
        when 'q'
          exit
        else
          puts "skipping ~/.#{file.sub('.erb', '')}"
        end
      end
    else
      link_file(file)
    end
  end
  download_omz
  download_vim_bundles
end

def download_omz
  if not(File.exist?(ENV['HOME'] + "/.oh-my-zsh"))
    system "git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh"
  end
  if not(File.exist?(ENV['HOME'] + "/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting"))
    system "git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting"
  end
end

def download_vim_bundles
  if not(File.exist?(ENV['HOME'] + "/.vim/bundle"))
    Dir.mkdir(ENV['HOME'] + "/.vim/bundle")
  end
  if not(File.exist?(ENV['HOME'] + "/.vim/bundle/vim-fugitive"))
    system "git clone https://github.com/tpope/vim-fugitive.git ~/.vim/bundle/vim-fugitive"
  end
  if not(File.exist?(ENV['HOME'] + "/.vim/bundle/vim-colors-solarized"))
    system "git clone https://github.com/altercation/vim-colors-solarized.git ~/.vim/bundle/vim-colors-solarized"
  end
  if not(File.exist?(ENV['HOME'] + "/.vim/bundle/vim-markdown"))
    system "git clone https://github.com/tpope/vim-markdown.git ~/.vim/bundle/vim-markdown"
  end
  if not(File.exist?(ENV['HOME'] + "/.vim/bundle/nerdtree"))
    system "git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree"
  end
  if not(File.exist?(ENV['HOME'] + "/.vim/bundle/vim-surround"))
    system "git clone https://github.com/tpope/vim-surround.git ~/.vim/bundle/vim-surround"
  end
  if not(File.exist?(ENV['HOME'] + "/.vim/bundle/editorconfig-vim"))
    system "git clone https://github.com/editorconfig/editorconfig-vim.git ~/.vim/bundle/editorconfig-vim"
  end
  if not(File.exist?(ENV['HOME'] + "/.vim/bundle/vim-javascript"))
    system "git clone https://github.com/pangloss/vim-javascript.git ~/.vim/bundle/vim-javascript"
  end
  if not(File.exist?(ENV['HOME'] + "/.vim/bundle/vim-snazzy"))
    system "git clone https://github.com/connorholyday/vim-snazzy.git ~/.vim/bundle/vim-snazzy"
  end
  if not(File.exist?(ENV['HOME'] + "/.vim/bundle/command-t"))
    system "git clone https://github.com/wincent/command-t.git ~/.vim/bundle/command-t"
    Dir.chdir ENV['HOME'] + "/.vim/bundle/command-t/ruby/command-t/ext/command-t"
    system "ruby extconf.rb"
    system "make"
    Dir.chdir File.expand_path(File.dirname(__FILE__))
  end
  if not(File.exist?(ENV['HOME'] + "/.vim/bundle/tabline.vim"))
    system "git clone https://github.com/mkitt/tabline.vim.git ~/.vim/bundle/tabline.vim"
  end
end

def replace_file(file)
  system %Q{rm -rf "$HOME/.#{file.sub('.erb', '')}"}
  link_file(file)
end

def link_file(file)
  if file =~ /.erb$/
    puts "generating ~/.#{file.sub('.erb', '')}"
    File.open(File.join(ENV['HOME'], ".#{file.sub('.erb', '')}"), 'w') do |new_file|
      new_file.write ERB.new(File.read(file)).result(binding)
    end
  else
    puts "linking ~/.#{file}"
    system %Q{ln -s "$PWD/#{file}" "$HOME/.#{file}"}
  end
end
