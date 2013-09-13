## ШРИ 2013

В этом репозитории будут домашние задания со ШРИ 2013, а также, возможно, некоторые «заметки на полях». Может получится что-то вроде дневника лекций как у Винера по теории информации. Для личного использования (приятно будет потом открыть и вспомнить чем занимался).

### Работа в терминале

Лекция Виктора Ашика о терминале, основных командах, конвейерах, философии юникс, переменных окружения и тому подобном.

*Домашнее задание*:

> Написать программу на `perl`, которая найдет все html-файлы и в заголовках страниц (внутри `<title>`) заменит ШРИ на КИТ

В качестве входных данных программы — пути до файлов. Интерфейс выглядит примерно таким образом:

```bash
perl replace-title path/to/files/*html
```

Тогда будут обработаны все файлы html в указанной папке.

Исходный код программы лежит в папке **perl-regexp** данного репозитория

На проверке домашнего задания Виктор показал как решается эта задача буквально в строку, используя потоковый редактор `sed` (однако, все-таки даже ее стоит оформить в отдельный файл, который потом выполнять из-под bash).

У меня вышло так:

```bash
sed -i .origin '/<title>/s/ШРИ/КИТ/' *html
```

Однако задача несколько усложнялась тем, что могут быть подпапки, скрипт тоже должен учесть это и рекурсивно обойти их все.

Когда выложат лекцию с разбором домашнего задания нужно будет еще раз посмотреть.
