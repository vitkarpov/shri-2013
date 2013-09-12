$string = "  <title>Командная строка — наше все. ШРИ 2013. Виктор Ашик.</title>";
print $string, "\n";
if ($string =~ m/<title>.*(ШРИ.*)<\/title>/mi) {
  $string =~ s/ШРИ/КИТ/;
}
print $string, "\n";