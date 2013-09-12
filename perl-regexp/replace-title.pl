# читаем каждую строку из файлов, которые пришли на стандартный ввод
while (<@ARGV>) {
  $file = $_;
  # получаем дескрипторы файлов для каждого, который пришел на ввод
  open(SOURCE, "< $file") or die "Couldn't open $file: $!\n";
  open(COPY, "> $file.tmp") or die "Couldn't open $file: $!\n";

  # будем писать во временные файлы
  select(COPY);
  # перебираем каждую строку исходного файла
  while (<SOURCE>) {
    # если нашли ШРИ между тегами title
    if ($_ =~ m/<title>.*(ШРИ.*)<\/title>/mi) {
      # заменим на ШРИ на КИТ
      $_ =~ s/ШРИ/КИТ/;
    }
    print $_ or die "couldn'r write $file: $!\n";
  }  

  # удаляем дескприторы
  close(SOURCE) or die "Couldn't close $file: $!\n";
  close(COPY)  or die "Couldn't close $file: $!\n";
  # заменяем оригинальные файлы, а последние кладем в бэкап
  # просто добавляем origin к имени
  rename($file, "$file.origin");
  rename("$file.tmp", $file);
}
END { close(STDOUT) or die "couldn't close STDOUT: $!" }