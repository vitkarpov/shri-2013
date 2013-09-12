$string = "     <title>Привет, я в ШРИ</title>";
print $string, "\n";
if ($string =~ m/<title>.*(ШРИ)<\/title>/mi) {
  $string =~ s/ШРИ/КИТ/;
}
print $string, "\n";