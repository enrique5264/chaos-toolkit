echo "Starting..."
ls
while getopts u: flag
do
    case "${flag}" in
        u) username=${OPTARG};;
    esac
done
echo "USername = $username"
if [ "$username" == "" ]; then
    echo "USERNAME IS NULLLL"
else
    echo "username is not null"
fi