# Системное программирование
[679e84225040133e8429ed75](https://e-learn.petrocollege.ru/course/view.php?id=6815)

- [Общее](#общее)
  - [Образ ОС](#образ-ос)
- [Исполняемые файлы](#исполняемые-файлы)
  - [Исполняемые файлы (bash)](#исполняемые-файлы-bash)
    - [Как устроены bash-скрипты](#как-устроены-bash-скрипты)
    - [Установка разрешений для файла сценария](#установка-разрешений-для-файла-сценария)
    - [Использование переменных](#использование-переменных)
    - [Зарезервированные переменные](#зарезервированные-переменные)
    - [Пользовательские переменные](#пользовательские-переменные)
    - [Математические операции](#математические-операции)
    - [Управляющая конструкция `if-then`](#управляющая-конструкция-if-then)
    - [Сравнение чисел](#сравнение-чисел)
    - [Задание 1:](#задание-1)
    - [Сравнение строк](#сравнение-строк)
    - [Циклы `for`](#циклы-for)
    - [Перебор простых значений](#перебор-простых-значений)
    - [Перебор сложных](#перебор-сложных)
    - [Инициализация цикла списком, полученным из результатов работы команды](#инициализация-цикла-списком-полученным-из-результатов-работы-команды)
    - [Разделители полей](#разделители-полей)
    - [Циклы `for` в стиле C](#циклы-for-в-стиле-c)
    - [Цикл `while`](#цикл-while)
- [Чтение параметров командной строки](#чтение-параметров-командной-строки)
  - [Чтение параметров](#чтение-параметров)
  - [Проверка параметров](#проверка-параметров)
  - [Подсчёт параметров](#подсчёт-параметров)
  - [Захват всех параметров командной строки](#захват-всех-параметров-командной-строки)
  - [Команда shift](#команда-shift)
  - [Ключи командной строки](#ключи-командной-строки)
  - [Как различать ключи и параметры](#как-различать-ключи-и-параметры)
  - [Получение данных от пользователя](#получение-данных-от-пользователя)
  - [Ввод паролей](#ввод-паролей)
  - [Чтение данных из файла](#чтение-данных-из-файла)

## Общее
[679e897e5040133e8429ed76](https://e-learn.petrocollege.ru/course/view.php?id=6815#section-0)

Все работы выполняются в ОС Ubuntu 22.04.03 lts Server.

### Образ ОС
https://e-learn.petrocollege.ru/mod/resource/view.php?id=313200

- log: user
- pass: 1234

## Исполняемые файлы
[679e8f315040133e8429ed77](https://e-learn.petrocollege.ru/course/view.php?id=6815#section-1)

### Исполняемые файлы (bash)
https://e-learn.petrocollege.ru/mod/resource/view.php?id=313188

Сценарии командной строки — это наборы тех же самых команд, которые можно вводить с клавиатуры, собранные в файлы и объединённые некоей общей целью. При этом результаты работы команд могут представлять либо самостоятельную ценность, либо служить входными данными для других команд.

Сценарии — это мощный способ автоматизации часто выполняемых действий.

#### Как устроены bash-скрипты
1. Любой bash-скрипт должен начинаться со строки:

    ```sh
    #!/bin/bash
    ```

    в этой строке после `#!` указывается путь к bash-интерпретатору, поэтому если он у вас установлен в другом месте (где, вы можете узнать набрав `whereis bash`) поменяйте её на ваш путь.

2. Коментарии начинаются с символа `#` (кроме первой строки).

3. В bash переменные не имеют типа.

Создайте пустой файл с использованием команды `touch`.
```sh
#!/bin/bash
```

В других строках этого файла символ решётки используется для обозначения комментариев, которые оболочка не обрабатывает. 
```sh
#!/bin/bash
# This is a comment
pwd
Whoami
```

#### Установка разрешений для файла сценария

*Попытка запуска файла сценария с неправильно настроенными разрешениями*:
```
$ ./myscript
bash: ./myscript: Permission denied
$
```

*Запуск файла с разрешениями:*
```
$ chmod +x ./myscript
$ ./myscript
/home/likegeeks/Desktop
likegeeks
$
```

```sh
#!/bin/bash
# our comment is here
echo "The current directory is:"
pwd
echo "The user logged in is:"
whoami
```

*Output*:
```
$ ./myscript
The current directory is:
/home/likegeeks/Desktop
The user logged in is:
likegeeks
```

#### Использование переменных
Переменные позволяют хранить в файле сценария информацию, например — результаты работы команд для использования их другими командами.

Существуют два типа переменных, которые можно использовать в bash-скриптах:
- переменные среды;
- пользовательские переменные.

```sh
#!/bin/bash
# display user home
echo "Home for the current user is: $HOME"
```

*Output*:
```sh
$ ./myscript
Home for the current user is: /home/likegeeks
```

#### Зарезервированные переменные
Встроенные переменные BASH:
- `$DIRSTACK` — содержимое вершины стека каталогов;

- `$EDITOR` — текстовый редактор по умолчанию;

- `$EUID` — эффективный UID, идентификационный номер пользователя, права которого были получены, возможно с помощью команды `su`. Если вы использовали программу `su` для выполнения команд от другого пользователя, то эта переменная содержит UID этого пользователя.

  > Значение переменной `$EUID` необязательно должно совпадать с содержимым переменной `$UID`!

- `$UID` - содержит реальный идентификатор, который устанавливается только при логине;

- `$FUNCNAME` — имя текущей функции в скрипте;

- `$GROUPS` — массив групп к которым принадлежит текущий пользователь;

- `$HOME` — домашний каталог пользователя;

- `$HOSTNAME` — ваш hostname;

- `$HOSTTYPE` — архитектура машины;

- `$LC_CTYPE` — внутренняя переменная, которая определяет кодировку символов;

- `$OLDPWD` — прежний рабочий каталог;

- `$OSTYPE` — тип ОС;

- `$PATH` — путь поиска программ;

- `$PPID` — идентификатор родительского процесса;

- `$SECONDS` — время работы скрипта (в сек.);

- `$#` — общее количество параметров, переданных скрипту;

- `$*` — все аргументы переданные скрипту (выводятся в строку);

- `$@` — тоже самое, что и предыдущий, но параметры выводятся в столбик;

- `$!` — PID последнего запущенного в фоне процесса;

- `$$` — PID самого скрипта.

#### Пользовательские переменные
Bash-скрипты позволяют задавать и использовать в сценарии собственные переменные. Подобные переменные хранят значение до тех пор, пока не завершится выполнение сценария.

```sh
#!/bin/bash
# testing variables
grade=5
person="Adam"
echo "$person is a good boy, he is in grade $grade"
```

*Output*:
```
$ ./myscript
Adam is a good boy, he is in grade 5
$
```

#### Математические операции
Для выполнения математических операций в файле скрипта можно использовать конструкцию вида `$((a+b))`:
```sh
#!/bin/bash
var1=$(( 5 + 5 ))
echo $var1
var2=$(( $var1 * 2 ))
echo $var2
```

*Output*:
```
$ ./myscript
10
20
$
```

#### Управляющая конструкция `if-then`
В наиболее простом виде она выглядит так:
```sh
if команда
then
  команды
fi
```

вот рабочий пример:
```sh
#!/bin/bash
if pwd
then
echo "It works"
fi
```

Для того, чтобы программа смогла сообщить и о результатах успешного поиска, и о неудаче, воспользуемся конструкцией `if-then-else`. Вот как она устроена:
```sh
if команда
then
  команды
else
  команды
fi
```

#### Сравнение чисел
Логические операторы:
```sh
-z    # строка пуста
-n    # строка не пуста
!=    # строки не равны
-eq   # равно
-ne   # неравно
-lt   # меньше
<     # меньше
-le   # меньше или равно
<=    # меньше или равно
-gt   # больше
>     # больше
-ge   # больше или равно
>=    # больше или равно
!     # отрицание логического выражения
-a    # логическое "И"
&&    # логическое "И"
-o    # логическое "ИЛИ"
||    # логическое "ИЛИ"
```

#### Задание 1:
Ввести числовую переменную.

Если переменная больше 5 то вывести на экран «The test value <переменная> is greater than 5» иначе «The test value <переменная> is not greater than 5».

```
$ ./myscript
The test value  is greater than 5
$
```

#### Сравнение строк
- `str1 = str2`: Проверяет строки на равенство, возвращает истину, если строки идентичны;
- `str1 != str2`: Возвращает истину, если строки не идентичны;
- `str1 < str2`: Возвращает истину, если `str1` меньше, чем `str2`;
- `str1 > str2`: Возвращает истину, если `str1` больше, чем `str2`;
- `-n str1`: Возвращает истину, если длина `str1` больше нуля;
- `-z str1`: Возвращает истину, если длина `str1` равна нулю.

```sh
#!/bin/bash
user ="likegeeks"
if [$user = $USER]
then
echo "The user $user is the current logged in user"
fi
```

*Output*:
```
The user likegeeks is the current logged in user
```

#### Циклы `for`
Базовая структура таких циклов:
```sh
for var in list
do
	команды
done
```

В каждой итерации цикла в переменную `var` будет записываться следующее значение из списка `list`.

#### Перебор простых значений
Перебор списка простых значений
```sh
#!/bin/bash
for var in first second third fourth fifth
do
	echo The  $var item
done
```

*Output*:
```
$ ./myscript
The first item
The second item
The third item
The fourth item
The fifth item
$
```

#### Перебор сложных
```sh
#!/bin/bash
for var in first "the second" "the third" "I’ll do it"
do
	echo "This is: $var"
done
```

*Output*:
```
$ ./myscript
This is: first
This is: the second
This is: the third
This is: I'll do it
$
```

#### Инициализация цикла списком, полученным из результатов работы команды
```sh
#!/bin/bash
file="myfile"
for var in $(cat $file)
do
echo " $var"
done
```

*Output*:
```sh
$ ./myscript
 hello
 this
 is
 test
$
```

#### Разделители полей
*[IFS]: Internal Field Separator
Причина вышеописанной особенности заключается в специальной переменной окружения, которая называется IFS (Internal Field Separator) и позволяет указывать разделители полей. По умолчанию оболочка bash считает разделителями полей следующие символы:
- Пробел
- Знак табуляции
- Знак перевода строки

```
IFS=$'\n'
```

#### Циклы `for` в стиле C
```c
for (i = 0; i < 10; i++)
{
	printf("number is %d\n", i);
}
```

Схема цикла выглядит так:
```c
for (( начальное значение переменной ; условие окончания цикла; изменение переменной ))
```

На bash это можно записать так:
```sh
for (( a = 1; a < 10; a++ ))
```

Пример:
```sh
#!/bin/bash
for (( i=1; i <= 10; i++ ))
do
echo "number is $i"
done
```

*Output*:
```sh
$ ./myscript
number 1 is 1
number 1 is 2
number 1 is 3
number 1 is 4
number 1 is 5
number 1 is 6
number 1 is 7
number 1 is 8
number 1 is 9
number 1 is 10
```

#### Цикл `while`
Вот схема организации циклов `while`:
```sh
while команда проверки условия
do
  другие команды
done
```

ПРИМЕР:
```sh
#!/bin/bash
var1=5
while [ $var1 -gt 0 ]
do
echo $var1
var1=$[ $var1 - 1 ]
done
```

## Чтение параметров командной строки
[679f375d5040133e8429ed7a](https://e-learn.petrocollege.ru/course/view.php?id=6815#section-2)

### Чтение параметров
[67a331485040133e8429ede5](https://e-learn.petrocollege.ru/mod/resource/view.php?id=313189)

```
$ ./myscript 10 20
```

- `$0` — имя скрипта;
- `$1` — первый параметр;
- `$2` — второй параметр — и так далее, вплоть до переменной `$9`, в которую попадает девятый параметр.

```sh
#!/bin/bash
echo $0
echo $1
echo $2
echo $3
```

Запустим сценарий с параметрами:
```
$ ./myscript 5 10 15
./myscript
5
10
15
```

```sh
#!/bin/bash
total=$[ $1 + $2 ]
echo The first parameter is $1.
echo The second parameter is $2.
echo The sum is $total.
```

Запустим скрипт и проверим результат вычислений.

```
$ ./myscript 5 10
The first parameter is 5.
The second parameter is 10.
The sum is 15.
```

```sh
#!/bin/bash
echo Hello $1, how do you do
```

Запустим его:
```
$ ./myscript Adam
Hello Adam, how do you do
```

Как видим, он выводит то, что мы от него ожидаем.

### Проверка параметров

```sh
#!/bin/bash
if [ -n "$1" ]
then
echo Hello $1.
else
echo "No parameters found. "
fi
```

Вызовем скрипт сначала с параметром, а потом без параметров.

```
$ ./myscript Adam
Hello Adam.
$ ./myscript
No parameters found.
```

### Подсчёт параметров

```sh
#!/bin/bash
echo There were $# parameters passed.
```

Вызовем сценарий.

```
$ ./myscript 1 2 3 4 5
There were 5 parameters passed.
```

```sh
#!/bin/bash
echo The last parameter was ${!#}
```

Вызовем скрипт и посмотрим, что он выведет.
```
$ ./myscript 1 2 3 4 5
The last parameter was 5
```

### Захват всех параметров командной строки
Переменная `$*` содержит все параметры, введённые в командной строке, в виде единого «слова».

В переменной `$@` параметры разбиты на отдельные «слова». Эти параметры можно перебирать в циклах. 

```sh
#!/bin/bash
echo "Using the \$* method: $*"
echo "----------"
echo "Using the \$@ method: $@"
```

Вот вывод скрипта.

```
$ ./myscript 1 2 3 4 5
Using the \$* method: 1 2 3 4 5
----------
Using the \$@ method: 1 2 3 4 5
```

```sh
#!/bin/bash
count=1
for param in "$*"
do
echo "\$* Parameter #$count = $param"
count=$(( $count + 1 ))
done
count=1
for param in "$@"
do
echo "\$@ Parameter #$count = $param"
count=$(( $count + 1 ))
done
```

Взгляните на то, что скрипт вывел в консоль. Разница между переменными вполне очевидна.

```
$ ./myscript 1 2 3 4 5
$* Parameter #1 = 1 2 3 4 5
$@ Parameter #1 = 1
$@ Parameter #2 = 2
$@ Parameter #3 = 3
$@ Parameter #4 = 4
$@ Parameter #5 = 5
```

### Команда shift

```sh
#!/bin/bash
count=1
while [ -n "$1" ]
do
echo "Parameter #$count = $1"
count=$(( $count + 1 ))
shift
done
```

```
$ ./myscript 1 2 3 4 5
$@ Parameter #1 = 1
$@ Parameter #2 = 2
$@ Parameter #3 = 3
$@ Parameter #4 = 4
$@ Parameter #5 = 5
```

### Ключи командной строки

```sh
#!/bin/bash
echo
while [ -n "$1" ]
do
case "$1" in
-a) echo "Found the -a option" ;;
-b) echo "Found the -b option" ;;
-c) echo "Found the -c option" ;;
*) echo "$1 is not an option" ;;
esac
shift
done
```

Запустим скрипт:
```
$ ./myscript -a -b -c -d

Found the -a option
Found the -b option
Found the -c option
-d is not an option
```

### Как различать ключи и параметры

```sh
#!/bin/bash
while [ -n "$1" ]
do
case "$1" in
-a) echo "Found the -a option" ;;
-b) echo "Found the -b option" ;;
-c) echo "Found the -c option" ;;
--) shift
break ;;
*) echo "$1 is not an option" ;;
esac
shift
done
count=1
for param in $@
do
echo "Parameter #$count: $param"
count=$(( $count + 1 ))
done
```

```
$ ./myscript -a -b -c -- 5 10 15
Found the -a option
Found the -b option
Found the -c option
Parameter #1: 5
Parameter #2: 10
Parameter #3: 15
```

### Получение данных от пользователя

```sh
#!/bin/bash
echo -n "Enter your name: "
read name
echo "Hello $name, welcome to my program."
```

```
$ ./myscript
Enter your name: Adam
Hello Adam, welcome to my program.
```

При вызове `read` можно указывать и несколько переменных:
```sh
#!/bin/bash
read -p "Enter your name: " first last
echo "Your data for $last, $first..."
```

Вот что выведет скрипт после запуска.

```
$ ./myscript
Enter your name: first last
Your data for last, first...
```

Если, вызвав `read`, не указывать переменную, данные, введённые пользователем, будут помещены в специальную переменную среды `REPLY:`
```sh
#!/bin/bash
read -p "Enter your name: "
echo Hello $REPLY, welcome to my program.
```

```
$ ./myscript
Enter your name: Adam
Hello Adam, welcome to my program.
```

```sh
#/bin/bash
if read -t 5 -p "Enter your name: " name
then
echo "Hello $name, welcome to my script"
else
echo "Sorry, too slow! "
fi
```

Если данные не будут введены в течение 5 секунд, скрипт выполнит ветвь условного оператора `else`, выведя извинения
```
$ ./myscript
Enter your name: Sorry, too slow!
```

### Ввод паролей

```sh
#!/bin/bash
read -s -p "Enter your password: " pass
echo "Is your password really $pass? "
```

Вот как отработает этот скрипт.

```
$ ./myscript
Enter your password: Is your password really secretpass?
```

### Чтение данных из файла

```sh
#!/bin/bash
count=1
cat myfile | while read line
do
echo "Line $count: $line"
count=$(( $count + 1 ))
done
echo "Finished"
```

Посмотрим на него в деле.

```
$ ./myscript
Line 1: hello
Line 2: this
Line 3: is
Line 4: test
Finished
```
