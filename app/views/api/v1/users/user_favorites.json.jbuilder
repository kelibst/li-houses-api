json.favorites @user_fav

json.extra do
    json.firstName @user.firstname
    json.lastName @user.lastname
    json.email @user.email
    json.isAdmin @user.isAdmin
end