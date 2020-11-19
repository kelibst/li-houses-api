json.id @user.id
json.username @user.username

json.body do
    json.firstName @user.firstname
    json.lastName @user.lastname
    json.email       @user.email
end

