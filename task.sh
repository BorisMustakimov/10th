#!/bin/bash

# ������ ������� task � ���������� ������������
# task
#   dir1
mkdir -p task/dir1

#   dir2
mkdir task/dir2

#   dir3
#       dir4
mkdir -p task/dir3/dir4

# �������� ������� ���������� �� task
cd task

# ������ ������ ���� task/dir2/empty
touch ./dir2/empty

# ������ ���� task/dir2/hello.sh � ����� �����������:
# #!/bin/bash
# echo "$1, ������!"
# bma �� �������� #!bin/bash �� �������� ������� ����������� �� ##
# bma $1 ������ �� $1 $2
echo '##!bin/bash
echo "$1 $2, ������!"' > ./dir2/hello.sh

# ������������� ��� task/dir2/hello.sh ����� rwxrw-r--
chmod 764 ./dir2/hello.sh

# ��������� ������ ������ task/dir2 � task/dir2/list.txt
ls ./dir2 > ./dir2/list.txt

# �������� ���������� �������� task/dir2 � ������� task/dir3/dir4
cp -r -T ./dir2 ./dir3/dir4

# ���������� � task/dir1/summary.txt ������ ������ � ����������� *.txt
# ����������� � task, ������� �������������
find -name "*.txt" > ./dir1/summary.txt

# ���������� � task/dir1/summary.txt ���������� task/dir2/list.txt
cat ./dir2/list.txt >> ./dir1/summary.txt

# ���������� ���������� ��������� NAME �� ��������� "���� ���������"
export NAME="���� ���������"

# ��������� task/dir2/hello.sh � ���������� ��������� NAME � �������� ���������
# ����� ������� ������ ���������� � ���� task/dir1/summary.txt
./dir2/hello.sh $NAME >> ./dir1/summary.txt

# ���������� � ��������������� task/dir1/summary.txt � task/������������ �������
mv ./dir1/summary.txt "������������ �������"

# ������� �� ������� ���������� ����� task/������������ �������
cat ./"������������ �������"

# ���� � ����� "������������ �������" ������, ������� �������� ����� "dir"
# � ����� ��������������� ��
grep "dir" ./"������������ �������" | sort

# ������ ������� ���������� �� ������������ ��� task
cd ./..

# ������� ���������� task �� ���� ����������
rm -rf task
