require 'rake'
require 'erb'

desc "install the dot files into user's home directory"
task :install do
  replace_all = false
  Dir['*'].each do |file|
    next if %w[Rakefile].include? file
    
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
    system "git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh"
  end
end

def download_vim_bundles
  if not(File.exist?(ENV['HOME'] + "/.vim/bundle"))
    Dir.mkdir(ENV['HOME'] + "/.vim/bundle"))
  end
  if not(File.exist?(ENV['HOME'] + "/.vim/bundle/vim-fugitive"))
    system "git clone git://github.com/tpope/vim-fugitive.git ~/.vim/bundle/vim-fugitive"
  end
  if not(File.exist?(ENV['HOME'] + "/.vim/bundle/vim-colors-solarized"))
    system "git clone git://github.com/altercation/vim-colors-solarized.git ~/.vim/bundle/vim-colors-solarized"
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
