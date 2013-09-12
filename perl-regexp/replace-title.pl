# читаем каждую строку из файлов, которые пришли на стандартный ввод
while (<@ARGV>) {
  $file = $_;
  open(SOURCE, "< $file") or die "Couldn't open $file: $!\n";
  open(COPY, "> $file.copy") or die "Couldn't open $file: $!\n";

  # select(COPY);
  while (<SOURCE>) {
    if ($_ =~ m/<title>.*(ШРИ)<\/title>/mi) {
      $_ =~ s/ШРИ/КИТ/;
    }  
    print 1, $_ or die "couldn'r write $file: $!\n";
  }  

  close(SOURCE) or die "Couldn't close $file: $!\n";
  close(COPY)  or die "Couldn't close $file: $!\n";
  rename($file, "$file.origin");
  rename("$file.copy", $file);
}
END { close(STDOUT) or die "couldn't close STDOUT: $!" }